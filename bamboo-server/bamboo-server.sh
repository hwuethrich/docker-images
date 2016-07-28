#!/usr/bin/env bash

set -e # Exit on errors

echo "-> Starting Bamboo Agent ..."
echo "   - BAMBOO_VERSION: $BAMBOO_VERSION"
echo "   - BAMBOO_HOME:    $BAMBOO_HOME"
echo "   - BAMBOO_SCHEME:  $BAMBOO_SCHEME"

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
  echo "-> Setting the HTTP/S settings in the server.xml"
  SERVER_XML=$BAMBOO_DIR/conf/server.xml
  xmlstarlet ed --pf --delete "//Connector[@port=8085]/@secure" $SERVER_XML > $SERVER_XML.tmp
  xmlstarlet ed --pf --delete "//Connector[@port=8085]/@scheme" $SERVER_XML.tmp > $SERVER_XML
  xmlstarlet ed --pf --delete "//Connector[@port=8085]/@proxyPort" $SERVER_XML > $SERVER_XML.tmp
  xmlstarlet ed --pf --delete "//Connector[@port=8085]/@redirectPort" $SERVER_XML.tmp > $SERVER_XML
  if [ $BAMBOO_SCHEME == "https" ]; then
    xmlstarlet ed --pf --insert "//Connector[@port=8085]" -t attr -n secure -v true $SERVER_XML > $SERVER_XML.tmp
    xmlstarlet ed --pf --insert "//Connector[@port=8085]" -t attr -n scheme -v https $SERVER_XML.tmp > $SERVER_XML
    xmlstarlet ed --pf --insert "//Connector[@port=8085]" -t attr -n proxyPort -v 443 $SERVER_XML > $SERVER_XML.tmp
    xmlstarlet ed --pf --insert "//Connector[@port=8085]" -t attr -n redirectPort -v 443 $SERVER_XML.tmp > $SERVER_XML
  else
    xmlstarlet ed --pf --insert "//Connector[@port=8085]" -t attr -n secure -v false $SERVER_XML > $SERVER_XML.tmp
    xmlstarlet ed --pf --insert "//Connector[@port=8085]" -t attr -n scheme -v http $SERVER_XML.tmp > $SERVER_XML
  fi
  rm $SERVER_XML.tmp
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
