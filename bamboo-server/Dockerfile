# Bamboo Server
#
# VERSION               0.0.1

FROM java
MAINTAINER H. Wüthrich "hw@5px.ch"

# Install Bamboo Server
ADD http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-5.1.1.tar.gz /tmp/atlassian-bamboo-5.1.1.tar.gz
RUN tar xzf /tmp/atlassian-bamboo-5.1.1.tar.gz -C /opt
RUN ln -s /opt/atlassian-bamboo-5.1.1 /opt/atlassian-bamboo

# Setup Bamboo Home
ENV BAMBOO_HOME /home/bamboo
RUN mkdir -p $BAMBOO_HOME

# Port redirection
EXPOSE 8085
EXPOSE 54663

# Add supervisor config
ADD supervisor.conf /etc/supervisor/conf.d/bamboo-server.conf

CMD ["start"]

