# Image `bamboo-ruby-extra`

[Atlassian Bamboo](https://www.atlassian.com/software/bamboo) agent based on [bamboo-ruby](../bamboo-ruby) with additional services and packages.

## Stack

Currently the image contains the following stack. If you would like to see more, feel free to create an issue or (even better) a pull request!

### Rubies

* MRI Ruby 1.9.3-p448, 2.0.0-p247, 2.1.0-preview1 (default: 2.0.0)

### Databases

* PostgreSQL 9.3 from *apt.postgresql.org* repository. The *bamboo* user has full access without any further configuration using `~/.pgpass`.

### Packages

* PhantomJS 1.9.2 from [phantomjs.googlecode.com](http://phantomjs.googlecode.com)
* NodeJS
* FreeTDS
* GraphicsMagick
* ImageMagick
* Microsoft Fonts
* Xvfb


## Usage

```
docker pull hwuethrich/bamboo-agent-extra
docker run -e BAMBOO_SERVER=http://<myserver>:8085 -d hwuethrich/bamboo-agent-extra
```