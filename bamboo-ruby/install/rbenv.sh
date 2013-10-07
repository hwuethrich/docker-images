#!/bin/bash

set -e # Exit on errors

# Essentials
apt-get -y install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config
apt-get clean

# Install rbenv
git clone https://github.com/sstephenson/rbenv.git $RBENV_ROOT

# Install ruby-build & rbenv-aliases
mkdir -p $RBENV_ROOT/plugins
git clone https://github.com/sstephenson/ruby-build.git $RBENV_ROOT/plugins/ruby-build
git clone git://github.com/tpope/rbenv-aliases.git      $RBENV_ROOT/plugins/rbenv-aliases
 
# Disable rdoc/ri
echo "gem: --no-document" > /.gemrc
