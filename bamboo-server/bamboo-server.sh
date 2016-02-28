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
  
  
  echo "Add MySQL Connector"
  
  if [ -z $MYSQL_CONNECTOR_VERSION ]; then
    echo "MYSQL_CONNECTOR_VERSION not set. Setting to 5.1.38"
    MYSQL_CONNECTOR_VERSION=5.1.38
  fi
  
  wget http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-$MYSQL_CONNECTOR_VERSION.tar.gz -O /tmp/mysql-connector.tar.gz
  tar xzf /tmp/mysql-connector.tar.gz -C /tmp
  mv /tmp/mysql-connector-java-$MYSQL_CONNECTOR_VERSION/mysql-connector-java-$MYSQL_CONNECTOR_VERSION-bin.jar $BAMBOO_DIR/lib/
  rm -Rf /tmp/*

  echo "-> Installation completed"
fi

# Uncomment to increase Tomcat's maximum heap allocation
# export JAVA_OPTS=-Xmx512M $JAVA_OPTS

echo "-> Running Bamboo server ..."
$BAMBOO_DIR/bin/catalina.sh run &

# Kill Bamboo process on signals from supervisor
trap 'kill $(jobs -p)' SIGINT SIGTERM EXIT

# Wait for Bamboo process to terminate
wait $(jobs -p)
