#!/bin/bash

# Install rubies
for version in 1.9.3-p448 2.0.0-p247 # 2.1.0-preview1
do
  rbenv install $version
  RBENV_VERSION=$version gem install bundler --no-rdoc --no-ri
done

# Make latest 2.0.0 default
rbenv global 2.0.0

# Configure bundler to use global directory for gems to save disk space
su - $BAMBOO_USER -c "bundle config path $BAMBOO_HOME/.bundle"

# Add Bamboo agent commands
rbenv rehash

for shim in $RBENV_ROOT/shims/*; do
  shim=$(basename $shim) # Strip path
  bamboo-capability-command $shim
done

# Add capabilities
for version in $RBENV_ROOT/versions/*; do
  version=$(basename $version) # Strip path
  bamboo-capability "Ruby $version" "`RBENV_VERSION=$version ruby -v`"
done
