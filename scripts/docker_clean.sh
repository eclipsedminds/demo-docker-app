#!/bin/sh

echo "Removing unused containers"
docker rm $(docker ps -qa --no-trunc --filter "status=exited")

echo "Removing unused images"
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)

