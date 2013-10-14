# Bamboo Agent Ruby
#
# VERSION               0.0.1

FROM hwuethrich/bamboo-agent
MAINTAINER H. Wüthrich "hw@5px.ch"

ADD install /tmp/install
RUN /tmp/install/rbenv.sh && rm -rf /tmp/install

CMD ["/start/supervisord"]
