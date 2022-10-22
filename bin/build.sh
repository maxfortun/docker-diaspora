#!/bin/bash -e
WD=$(dirname $0)

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

docker build -t $IMAGE $WD/../docker/$flavor
