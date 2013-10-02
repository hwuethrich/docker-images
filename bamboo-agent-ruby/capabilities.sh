#!/bin/bash

rbenv rehash

BAMBOO_CAPABILITIES=$BAMBOO_HOME/bin/bamboo-capabilities.properties

echo "system.builder.command.Ruby=`which ruby`"     >> $BAMBOO_CAPABILITIES
echo "system.builder.command.Rake=`which rake`"     >> $BAMBOO_CAPABILITIES
echo "system.builder.command.Bundle=`which bundle`" >> $BAMBOO_CAPABILITIES
