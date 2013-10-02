#!/usr/bin/env bash

set -e # Exit on errors

echo "-> Starting Bamboo Agent ..."
echo "   - BAMBOO_HOME:   $BAMBOO_HOME"
echo "   - BAMBOO_SERVER: $BAMBOO_SERVER"

mkdir -p $BAMBOO_HOME

BAMBOO_INSTALLER=$BAMBOO_HOME/bamboo-agent-installer.jar
if [ -f $BAMBOO_INSTALLER ]; then
  echo "-> Installer already found at $BAMBOO_INSTALLER. Skipping download."
else
  BAMBOO_INSTALLER_URL=$BAMBOO_SERVER/agentServer/agentInstaller
  echo "-> Downloading installer from $BAMBOO_INSTALLER_URL ..."
  wget --progress=dot:mega $BAMBOO_INSTALLER_URL -O $BAMBOO_INSTALLER
fi

echo "-> Running Bamboo Installer ..."
java -Dbamboo.home=$BAMBOO_HOME -jar $BAMBOO_INSTALLER $BAMBOO_SERVER/agentServer/
