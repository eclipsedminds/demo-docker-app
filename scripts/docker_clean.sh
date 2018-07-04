#!/bin/sh

echo "Removing unused containers"
containers=$(docker ps -qa --no-trunc --filter "status=exited")
[ ! -z "$containers" ] && docker rm "$containers"

echo "Removing unused images"
images=$(docker images --filter "dangling=true" -q --no-trunc)
[ ! -z "$images" ] && docker rmi "$images"
