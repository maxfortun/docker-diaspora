FROM ruby:2.7.6-alpine3.16

RUN apk add build-base git curl curl-dev ghostscript-fonts imagemagick imagemagick-dev nodejs redis openssl-dev libxml2-dev libxslt-dev libpq-dev bash postgresql postgresql-client procps tzdata gcompat python3 python3-dev py3-pip perl cmake

RUN pip3 install ruamel.yaml.cmd

RUN adduser -D -s /bin/bash diaspora

RUN mkdir /run/postgresql && \
	chown postgres:postgres /run/postgresql

USER postgres

RUN mkdir /var/lib/postgresql/data && \
	chmod 0700 /var/lib/postgresql/data && \
	initdb -D /var/lib/postgresql/data && \
	sed -i "s@#listen_addresses\s=\s'localhost'@listen_addresses = 'localhost'@" /var/lib/postgresql/data/postgresql.conf

USER diaspora
WORKDIR /home/diaspora 

RUN git clone -b master https://github.com/diaspora/diaspora.git

WORKDIR /home/diaspora/diaspora

RUN yaml merge-expand config/database.yml.example config/database.yml && \
	cp config/diaspora.toml.example config/diaspora.toml && \
	script/configure_bundler

RUN bin/bundle install --full-index --with=postgres

RUN sed -i 's@#certificate_authorities = "/etc/ssl/certs/ca-certificates.crt"@certificate_authorities = "/etc/ssl/certs/ca-certificates.crt"@g' config/diaspora.toml

USER root

RUN su postgres -c "pg_ctl start -D /var/lib/postgresql/data" && \
	su diaspora -c 'bundle exec rake db:create db:migrate' && \
	su diaspora -c 'bin/rake assets:precompile' 

ADD docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

CMD [ "/usr/local/bin/docker-entrypoint.sh" ]

