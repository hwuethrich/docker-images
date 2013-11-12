#!/bin/bash

set -e

# Add bamboo user
useradd --create-home --shell /bin/bash --comment "Bamboo User" $BAMBOO_USER

# Accept EULA for MS fonts
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections # Accept EULA for MS fonts

# Install common packages
eatmydata -- apt-get -yq install \
  curl wget ssh-client wkhtmltopdf \
  nodejs xvfb git subversion imagemagick graphicsmagick \
	freetds-bin freetds-dev libfontconfig1 ttf-mscorefonts-installer \
  uuid-dev libqt4-dev libqt4-gui fop libservlet2.4-java 

# Add bash and git as bamboo commands
bamboo-capability-command bash git
