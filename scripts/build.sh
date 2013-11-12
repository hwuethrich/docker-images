#!/bin/bash

set -e # Exit on errors

for image in base supervisord bamboo-server bamboo-agent
do
    echo "=> Building $image ..."
    docker build -rm -t hwuethrich/$image $image
done
