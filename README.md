# docker-diaspora
Diaspora docker image

## Building
```bash
	bin/build.sh alpine
```

## Dependencies
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

## Configuration

## Running
### Container
```bash
	bin/run.sh alpine
```

### Eco-system
```bash
	bin/run.sh alpine
```
