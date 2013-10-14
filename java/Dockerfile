# Java Container
#
# VERSION               0.0.1

FROM hwuethrich/base
MAINTAINER H. Wüthrich "hw@5px.ch"

# Install Java from PPA
# RUN apt-get install -y python-software-properties
# RUN add-apt-repository ppa:webupd8team/java -y
# RUN apt-get update
# RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
# RUN apt-get install -y git curl oracle-java7-installer

# Save some layers... see docker issue #1171
RUN eatmydata bash -c 'apt-get install -y python-software-properties && add-apt-repository ppa:webupd8team/java -y && apt-get update'
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections 
RUN eatmydata -- apt-get install -y oracle-java7-installer
