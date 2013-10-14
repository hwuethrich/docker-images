#!/bin/bash


# CONTAINERS

echo "Removing stopped containers:"
docker ps -a | grep --color=never 'Exit'
read -p "Are you sure? " -n 1 -r

if [[ ! $REPLY =~ ^[Yy]$ ]]; then exit 1; fi

docker ps -a | grep 'Exit' | awk '{print $1}' | xargs docker rm


# IMAGES

echo "Removing untagged images:"
docker images | grep --color=never '<none>'
read -p "Are you sure? " -n 1 -r

if [[ ! $REPLY =~ ^[Yy]$ ]]; then exit 1; fi

docker images | grep "<none>" | awk '{print $3}' | xargs docker rmi

