# Bamboo Server
#
# VERSION               0.0.1

FROM hwuethrich/java
MAINTAINER H. Wüthrich "hw@5px.ch"

# Environment
ENV BAMBOO_VERSION 5.1.1
ENV BAMBOO_HOME /home/bamboo

# Add startup script and supervisor config
ADD bamboo-server.sh /start/bamboo-server
ADD supervisor.conf /etc/supervisor/conf.d/bamboo-server.conf

# Expose web and agent ports
EXPOSE 8085
EXPOSE 54663

CMD ["/start/supervisord"]

