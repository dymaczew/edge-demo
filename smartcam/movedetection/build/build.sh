#!/bin/bash -x

if [ "$#" -ne "1" ]; then
  echo "Usage: `basename $0` VERSION"
  exit 1
fi
VERSION=$1
NAME=movedetection

if [ -z "$HZN_ORG_ID" ]; then
    HZN_ORG_ID=acmegrocery
fi
if [ -z "$ARCH" ]; then
  arch=`uname -m`
  if [ "$arch" == "x86_64" ]; then
    ARCH=amd64
  elif [ "$arch" == "armv71" ]; then
    ARCH=arm
  fi
fi

# Build and execute a simple NodeJS application that will respond to a CURL request to PORT 2020
echo *INFO* finding and removing any previous instances
id=`docker ps -a|grep -i $NAME\_$ARCH|awk '{print $1}'`
if [ ! -z "$id" ]; then
  docker stop ${id}
  docker rm ${id}
  docker rmi $HZN_ORG_ID/$NAME\_$ARCH:$VERSION
fi  
echo *INFO* building a new container image
docker build -t $HZN_ORG_ID/$NAME\_$ARCH:$VERSION .
docker push $HZN_ORG_ID/$NAME\_$ARCH:$VERSION

