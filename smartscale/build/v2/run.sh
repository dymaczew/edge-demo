#!/bin/sh
echo *INFO* running our new image and exposing service on port 2022
docker run -p 2022:8082 -d acmegrocery/scales:v2
id=`docker ps|grep -i scales|awk '{print $1}'`
echo *INFO* waiting 5 seconds for the NodeJS server to initialise
sleep 5
echo *INFO* look at the application logs
docker logs ${id}
echo *INFO* send a request to the server
curl -i localhost:2022



