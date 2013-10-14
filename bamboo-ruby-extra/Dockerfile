# Bamboo Agent Ruby
#
# VERSION               0.0.1

FROM hwuethrich/bamboo-ruby
MAINTAINER H. Wüthrich "hw@5px.ch"

# Add and run setup scripts
ADD install /tmp/install/
RUN eatmydata -- /tmp/install/all.sh

# Add startup scripts
ADD start /start

# Add supervisor configurations
ADD supervisor /etc/supervisor/conf.d/

CMD ["/start/supervisord"]
