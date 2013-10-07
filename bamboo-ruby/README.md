# Image `bamboo-agent-ruby`

Bamboo agent with [rbenv](https://github.com/sstephenson/rbenv) and requirements to build rubies. Based on [hwuethrich/bamboo-agent](../bamboo-agent).

Also installs the following rbenv plugins:

* [ruby-build](https://github.com/sstephenson/ruby-build)  
* [rbenv-aliases](https://github.com/tpope/rbenv-aliases)

This image is intended to be used as a base for your own image and might not be very useful on its own. If you are looking for an image with preinstalled rubies, see [`hwuethrich/bamboo-ruby-extra`](../bamboo-ruby-extra)

## Usage

To start the agent, simple run

```
docker pull hwuethrich/bamboo-ruby
docker run -e BAMBOO_SERVER=http://<host>:8085 -d hwuethrich/bamboo-ruby
```
