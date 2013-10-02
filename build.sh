#!/bin/bash

set -e # Exit on errors

for image in base java bamboo-server bamboo-agent bamboo-agent-ruby
do
echo "=> Building $image ..."
docker build -t hwuethrich/$image $image
done
