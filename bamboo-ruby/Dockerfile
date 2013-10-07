# Bamboo Agent Ruby
#
# VERSION               0.0.1

FROM hwuethrich/bamboo-agent
MAINTAINER H. Wüthrich "hw@5px.ch"

# Set rbenv environment
ENV RBENV_ROOT /usr/local/rbenv
ENV PATH $RBENV_ROOT/shims:$RBENV_ROOT/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ADD install /tmp/install
RUN /tmp/install/rbenv.sh && rm -rf /tmp/install

CMD ["/start/supervisord"]
