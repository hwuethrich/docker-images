# Bamboo Agent
#
# VERSION               0.0.1

FROM hwuethrich/supervisord
MAINTAINER H. Wüthrich "hw@5px.ch"

# Environment
ENV BAMBOO_USER   bamboo
ENV BAMBOO_HOME   /home/$BAMBOO_USER
ENV BAMBOO_SERVER http://changeme:8085

# Install Bamboo Agent
ADD start      /start
ADD supervisor /etc/supervisor/conf.d
ADD bin        /usr/local/bin

# Add and run install scripts
ADD install /tmp/install
RUN /tmp/install/all.sh && rm -rf /tmp/install

# Run supervisord
CMD ["/start/supervisord"]
