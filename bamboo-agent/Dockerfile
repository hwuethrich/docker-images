# Bamboo Agent
#
# VERSION               0.0.1

FROM hwuethrich/java
MAINTAINER H. Wüthrich "hw@5px.ch"

# Environment
ENV BAMBOO_USER   bamboo
ENV BAMBOO_HOME   /home/$BAMBOO_USER
ENV BAMBOO_SERVER http://changeme:8085

# Install Bamboo Agent
ADD supervisor.conf /etc/supervisor/conf.d/bamboo-agent.conf
ADD bamboo-agent.sh /start/bamboo-agent
ADD bin /usr/local/bin

# Add bamboo user
RUN useradd --create-home --shell /bin/bash --comment "Bamboo User" $BAMBOO_USER

# Add Bash command
RUN su - bamboo -c 'bamboo-capability-command bash git'

CMD ["/start/supervisord"]
