# docker-diaspora
Diaspora docker image

## Building
```bash
	bin/build.sh alpine
```
## Configuration
### Database
```bash
	docker run --name postgres \
		-v /custom/mount:/var/lib/postgresql/data \
		-v /config/postgres-passwd:/run/secrets/postgres-passwd \
		-e POSTGRES_PASSWORD_FILE=/run/secrets/postgres-passwd \
		-e PGDATA=/var/lib/postgresql/data/pgdata \
		-d postgres:alpine3.16
```
### Redis
```bash
	docker run --name redis \
		-v /config/redis.conf:/usr/local/etc/redis/redis.conf \
		-d redis:alpine3.16
```
## Running
```bash
	bin/run.sh alpine
```
