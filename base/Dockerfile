# Base
#
# VERSION               0.0.1

FROM ubuntu
MAINTAINER H. Wüthrich "hw@5px.ch"

# Env
ENV DEBIAN_FRONTEND noninteractive

# Make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe restricted multiverse" > /etc/apt/sources.list
RUN apt-get update && apt-get upgrade && apt-get -y install curl wget git-core vim htop supervisor # 10/7/2013

# Configure supervisor
ADD supervisord.conf /etc/supervisor/supervisord.conf

# Add startup script
ADD start /start

# Run supervisord
CMD ["/start/supervisord"]
