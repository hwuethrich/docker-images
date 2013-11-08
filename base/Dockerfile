# Base
#
# VERSION               0.0.1

FROM ubuntu
MAINTAINER H. Wüthrich "hw@5px.ch"

# Tell dpkg not to ask questions
ENV DEBIAN_FRONTEND noninteractive

# This forces dpkg not to call sync() after package extraction and speeds up install
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

# We don't need an apt cache in a container
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

# Make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe restricted multiverse" > /etc/apt/sources.list
RUN apt-get update && apt-get -qy install eatmydata # 11/08/2013

# Fix locales
ENV LANGUAGE en_US.UTF-8
ENV LANG     en_US.UTF-8
ENV LC_ALL   en_US.UTF-8
RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales

# Add init scripts
ADD init /init
