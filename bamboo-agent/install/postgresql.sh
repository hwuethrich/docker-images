#!/bin/bash

#
# PostgreSQL 9.3
#

PG_VERSION=9.3

# Set locale for new cluster
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Install from apt.postgresql.org
echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list
wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
apt-get update && eatmydata apt-get -yq install postgresql-$PG_VERSION postgresql-contrib-$PG_VERSION postgresql-client-$PG_VERSION postgresql-server-dev-$PG_VERSION libpq5 libpq-dev

# Recreate cluster with UTF-8 encoding
pg_dropcluster --stop $PG_VERSION main
pg_createcluster --start -e UTF-8 $PG_VERSION main

# Create user 'bamboo' with password 'bamboo'
echo "CREATE USER $BAMBOO_USER WITH CREATEDB CREATEUSER PASSWORD '$BAMBOO_USER';" | su postgres -c psql
echo "CREATE DATABASE $BAMBOO_USER OWNER $BAMBOO_USER" | su postgres -c psql

# Don't ask for password
# See http://www.postgresql.org/docs/9.3/interactive/libpq-pgpass.html
echo "localhost:5432:*:$BAMBOO_USER:$PASS" > $BAMBOO_HOME/.pgpass
chmod 0600 $BAMBOO_HOME/.pgpass
chown $BAMBOO_USER:$BAMBOO_USER $BAMBOO_HOME/.pgpass

# Clean stop
/etc/init.d/postgresql stop

# Function to override settings in postgresql.conf
function postgresql_conf () {
  sed -i "s/^[#\s]*$1.*$/$1 = $2/" /etc/postgresql/$PG_VERSION/main/postgresql.conf
}

# We don't care about concistency if case of power failure
postgresql_conf fsync off
postgresql_conf full_page_writes off

# Adjust max. connections and memory
postgresql_conf max_connections 20
postgresql_conf shared_buffers 128MB
postgresql_conf work_mem 32MB
