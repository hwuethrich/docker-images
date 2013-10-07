#!/bin/bash

set -e # Exit on errors

for image in base java bamboo-server bamboo-agent bamboo-ruby
do
    echo "=> Pushing $image ..."
    docker push hwuethrich/$image > /dev/null
done
