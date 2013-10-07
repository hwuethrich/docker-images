#!/bin/bash

set -e # Exit on errors

for image in base java bamboo-server bamboo-agent bamboo-ruby bamboo-ruby-extra
do
    echo "=> Building $image ..."
    docker build -rm -t hwuethrich/$image $image
done
