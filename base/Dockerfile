# Base
#
# VERSION               0.0.1

FROM ubuntu
MAINTAINER H. Wüthrich "hw@5px.ch"

# Env
ENV DEBIAN_FRONTEND noninteractive

# Make sure the package repository is up to date
ADD sources.list /etc/apt/sources.list
RUN apt-get update && apt-get -y install curl wget git-core vim htop supervisor

# Configure supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/supervisor.conf

# Add startup script
ADD start /usr/local/bin/start

CMD ["start"]

