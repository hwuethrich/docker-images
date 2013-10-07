#!/bin/bash -l

set -e # Exit on errors

# Install common packages
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections # Accept EULA for MS fonts
apt-get -y install freetds-bin freetds-dev libfontconfig1 ttf-mscorefonts-installer libqt4-dev libqt4-gui nodejs xvfb imagemagick graphicsmagick uuid-dev fop
apt-get clean

install=${0%/*}
source $install/phantomjs.sh
source $install/rubies.sh
source $install/postgresql.sh
