#!/bin/bash -ex
cd $(dirname $0)
WD=$PWD
cd $OLDPWD

flavor=$1

if [ -z "$flavor" ]; then
	echo "Usage: $0 <flavor> [args]"
	echo " e.g.: $0 alpine"
	echo " e.g.: $0 alpine ash"
	echo "Flavors: "
	ls -1 $WD/../docker
	exit 1
fi

shift

IMAGE=docker-$flavor-diaspora
NAME=$IMAGE

DOCKER_RUN_ARGS+=( -v $WD/../config/diaspora.toml:/home/diaspora/diaspora/config/diaspora.toml )
DOCKER_RUN_ARGS+=( -v $WD/../config/database.yml:/home/diaspora/diaspora/config/database.yml )

docker run --rm -it "${DOCKER_RUN_ARGS[@]}" --name $NAME $IMAGE "$@"

