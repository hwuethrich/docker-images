# Bamboo Server
#
# VERSION               0.0.1

FROM hwuethrich/supervisord
MAINTAINER H. Wüthrich "hw@5px.ch"

# Environment
ENV BAMBOO_VERSION 5.1.1
ENV BAMBOO_HOME /home/bamboo

# Add startup script and supervisor config
ADD bamboo-server.sh /start/bamboo-server
ADD supervisor.conf /etc/supervisor/conf.d/bamboo-server.conf

# Install Oracle Java 7
RUN eatmydata bash -c 'apt-get install -y python-software-properties && add-apt-repository ppa:webupd8team/java -y && apt-get update'
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN eatmydata -- apt-get install -y oracle-java7-installer

# Expose web and agent ports
EXPOSE 8085
EXPOSE 54663

# Run supervisord
CMD ["/start/supervisord"]
