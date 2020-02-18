#!/bin/sh
docker login --username=acmegrocery --password=5f47ecdd-a6cb-4a08-b99a-c03286e61954

# Build and execute a simple NodeJS application that will respond to a CURL request to PORT 2020
echo *INFO* finding and removing any previous instances
id=`docker ps -a|grep -i scales_amd64|awk '{print $1}'`
docker stop ${id}
docker rm ${id}
docker rmi acmegrocery/scales_amd64:v1
echo *INFO* building a new NodeJS container image
docker build -t acmegrocery/scales_amd64:v1 .
sudo docker push acmegrocery/scales_amd64:v1

