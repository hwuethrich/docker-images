# Bamboo Agent
#
# VERSION               0.0.1

FROM hwuethrich/java
MAINTAINER H. Wüthrich "hw@5px.ch"

# Environment
ENV BAMBOO_HOME   /home/bamboo
ENV BAMBOO_SERVER http://changeme:8085

# Install Bamboo Agent
ADD supervisor.conf /etc/supervisor/conf.d/bamboo-agent.conf
ADD bamboo-agent.sh /start/bamboo-agent

# Add capabilities
RUN mkdir -p $BAMBOO_HOME/bin

# Add Bash command
RUN echo "system.builder.command.Bash=`which bash`" >> $BAMBOO_HOME/bin/bamboo-capabilities.properties

CMD ["/start/supervisord"]
