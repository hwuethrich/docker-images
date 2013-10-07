#!/bin/bash

PHANTOMJS_VERSION=1.9.2-linux-x86_64

wget --progress=dot:mega https://phantomjs.googlecode.com/files/phantomjs-$PHANTOMJS_VERSION.tar.bz2 -O /tmp/phantomjs.tar.bz2
tar xjf /tmp/phantomjs.tar.bz2 phantomjs-$PHANTOMJS_VERSION/bin/phantomjs -O > /usr/bin/phantomjs
chmod +x /usr/bin/phantomjs
rm -rf /tmp/phantomjs.tar.bz2

# Add phantomjs as Bamboo agent command
bamboo-capability-command phantomjs
bamboo-capability "PhantomJS" "`phantomjs -v`"
