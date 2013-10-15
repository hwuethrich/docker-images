#!/bin/bash

set -e # Exit on errors

for image in base java bamboo-server bamboo-agent bamboo-ruby bamboo-ruby-extra
do
    echo "=> Pushing $image ..."
    docker push hwuethrich/$image
done
