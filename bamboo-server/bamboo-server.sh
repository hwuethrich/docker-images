#!/usr/bin/env bash

set -e # Exit on errors

echo "-> Starting Bamboo Agent ..."
echo "   - BAMBOO_VERSION: $BAMBOO_VERSION"
echo "   - BAMBOO_HOME:    $BAMBOO_HOME"

mkdir -p $BAMBOO_HOME

BAMBOO_DIR=/opt/atlassian-bamboo-$BAMBOO_VERSION

if [ -d $BAMBOO_DIR ]; then
  echo "-> Bamboo $BAMBOO_VERSION already found at $BAMBOO_DIR. Skipping download."
else
  BAMBOO_TARBALL_URL=http://downloads.atlassian.com/software/bamboo/downloads/atlassian-bamboo-$BAMBOO_VERSION.tar.gz
  echo "-> Downloading Bamboo $BAMBOO_VERSION from $BAMBOO_TARBALL_URL ..."
  wget --progress=dot:mega $BAMBOO_TARBALL_URL -O /tmp/atlassian-bamboo.tar.gz
  echo "-> Extracting to $BAMBOO_DIR ..."
  tar xzf /tmp/atlassian-bamboo.tar.gz -C /opt
  rm -f /tmp/atlassian-bamboo.tar.gz
  echo "-> Installation completed"
fi

echo "-> Running Bamboo Server ..."
$BAMBOO_DIR/bin/catalina.sh run
