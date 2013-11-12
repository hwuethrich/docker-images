#!/bin/bash

set -e

# Add webupd8team apt repsitory
eatmydata -- apt-get install -yq python-software-properties
add-apt-repository ppa:webupd8team/java -y && apt-get update

# Install Oracle Java 7
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
eatmydata -- apt-get install -yq oracle-java7-installer
