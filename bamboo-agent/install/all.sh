#!/bin/bash -l

set -e # Exit on errors

install=${0%/*}
source $install/base.sh
source $install/java.sh
source $install/rbenv.sh
source $install/rubies.sh
source $install/phantomjs.sh
source $install/postgresql.sh

# Fix permissions
chown -R $BAMBOO_USER:$BAMBOO_USER $BAMBOO_HOME
