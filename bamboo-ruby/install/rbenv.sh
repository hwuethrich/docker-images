#!/bin/bash

set -e # Exit on errors

# Essentials
apt-get -y install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config 

# Install rbenv in BAMBOO_HOME
export RBENV_ROOT=$BAMBOO_HOME/.rbenv

# Install rbenv
git clone https://github.com/sstephenson/rbenv.git $RBENV_ROOT

# Enable rbenv for shells
tee -a $BAMBOO_HOME/.profile <<'EOF'

# Set path for rbenv and init shell
if [ -z "$RBENV_SHELL" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
EOF

# Install ruby-build & rbenv-aliases
mkdir -p $RBENV_ROOT/plugins
git clone https://github.com/sstephenson/ruby-build.git $RBENV_ROOT/plugins/ruby-build
git clone git://github.com/tpope/rbenv-aliases.git      $RBENV_ROOT/plugins/rbenv-aliases

# Disable rdoc/ri
echo "gem: --no-document" >> $BAMBOO_HOME/.gemrc

# Fix permissions
chown -R $BAMBOO_USER:$BAMBOO_USER $BAMBOO_HOME
