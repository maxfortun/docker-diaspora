#!/bin/bash -ex

su postgres -c "pg_ctl start -D /var/lib/postgresql/data"

redis-server /etc/redis.conf &

su diaspora -c ". $HOME/.profile && /home/diaspora/diaspora/script/server"

