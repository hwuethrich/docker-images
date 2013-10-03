# Bamboo Agent Ruby
#
# VERSION               0.0.1

FROM hwuethrich/bamboo-agent
MAINTAINER H. Wüthrich "hw@5px.ch"

# Essentials
RUN apt-get -y install curl git-core build-essential zlib1g-dev libssl-dev openssl libreadline-dev sqlite3 libsqlite3-dev libxslt-dev libxml2-dev

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
ADD rbenv.sh /etc/profile.d/rbenv.sh

# Set rbenv environment
ENV RBENV_ROOT /usr/local/rbenv
ENV PATH /usr/local/rbenv/shims:/usr/local/rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Install ruby-build & rbenv-aliases
RUN mkdir -p /usr/local/rbenv/plugins && cd /usr/local/rbenv/plugins && git clone https://github.com/sstephenson/ruby-build.git && git clone git://github.com/tpope/rbenv-aliases.git

# Install Ruby 2.0.0 and make it default
RUN rbenv install 2.0.0-p247 && rbenv global 2.0.0-p247

# Disable rdoc/ri
RUN echo "gem: --no-document" > /.gemrc

# Install Bundler
RUN gem install bundler

# Generate bamboo-capabilities.properties
ADD capabilities.sh /tmp/
RUN /tmp/capabilities.sh

CMD ["start"]
