#!/bin/bash

set -e # Exit on errors

for image in base supervisord bamboo-server bamboo-agent
do
    echo "=> Pushing $image ..."
    docker push hwuethrich/$image
done
