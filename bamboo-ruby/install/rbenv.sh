#!/bin/bash

set -e # Exit on errors

# Essentials
apt-get -y install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config
apt-get clean

# Install rbenv
git clone https://github.com/sstephenson/rbenv.git $RBENV_ROOT

# Enable rbenv for shells
echo "export RBENV_ROOT=$RBENV_ROOT"                       >> /etc/profile.d/rbenv.sh
echo 'export PATH=$RBENV_ROOT/shims:$RBENV_ROOT/bin:$PATH' >> /etc/profile.d/rbenv.sh
echo 'eval "$($RBENV_ROOT/bin/rbenv init -)"'              >> /etc/profile.d/rbenv.sh
chmod +x /etc/profile.d/rbenv.sh

# Install ruby-build & rbenv-aliases
mkdir -p $RBENV_ROOT/plugins
git clone https://github.com/sstephenson/ruby-build.git $RBENV_ROOT/plugins/ruby-build
git clone git://github.com/tpope/rbenv-aliases.git      $RBENV_ROOT/plugins/rbenv-aliases

# Disable rdoc/ri
echo "gem: --no-ri --no-rdoc"     >> $BAMBOO_HOME/.gemrc
echo "install: --no-ri --no-rdoc" >> $BAMBOO_HOME/.gemrc
echo "update: --no-ri --no-rdoc"  >> $BAMBOO_HOME/.gemrc
