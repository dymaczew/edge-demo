#!/bin/sh
export DOCKER_HUB_ID=acmegrocery
echo  5f47ecdd-a6cb-4a08-b99a-c03286e61954 | docker login -u $DOCKER_HUB_ID --password-stdin

