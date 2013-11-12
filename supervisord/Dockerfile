# Base image with supervisord
# http://supervisord.org/

FROM hwuethrich/base
MAINTAINER H. Wüthrich "hw@5px.ch"

# Install supervisor
RUN eatmydata apt-get -y install supervisor && /etc/init.d/supervisor stop

# Configure supervisor
ADD supervisord.conf /etc/supervisor/supervisord.conf

# Add startup script
ADD start /start

# Run supervisord
CMD ["/start/supervisord"]
