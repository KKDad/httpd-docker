#!/bin/sh
#
# Build httpd and push to the stapledon docker registry

set -e

BUILD_TAG=$1
if [ -z $BUILD_TAG ]; then
   echo "Build Tag is required"
   exit
fi

DOCKER_REGISTRY=registry.stapledon.ca

docker build -f Dockerfile . --tag kkdad/httpd:$BUILD_TAG --platform linux/amd64
docker tag kkdad/httpd:$BUILD_TAG $DOCKER_REGISTRY/kkdad/httpd:$BUILD_TAG
docker push $DOCKER_REGISTRY/kkdad/httpd:$BUILD_TAG
  