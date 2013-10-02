# Images for [docker.io](http://docker.io)

My collection of docker images. See [here](https://index.docker.io/u/hwuethrich/) for how to get them.

## base

Basic image with `curl`, `wget`, `git-core`, `vim`, `htop` and `supervisor`. Currently uses 
the [Hetzner](http://www.hetzner.de) Ubuntu repository, because thats where I'm running docker.

The default CMD is `start`, which adds the current hostname to `/etc/hosts` and runs `supervisord`. 
Additional services may be added to `/etc/supervisor/conf.d/`.

## java

Base image with Java from the webupd8team PPA. Based on image `hwuethrich\base`.

## bamboo-server

Downloads and installs [Atlassian Bamboo](https://www.atlassian.com/software/bamboo) 
and runs the server using `supervisord`. Based on image `hwuethrich/java`. 

#### Usage

It's as simple as:

```
docker pull hwuethrich/bamboo-server
docker run -d hwuethrich/bamboo-server
```

By default the Bamboo config and database is stored in the container in `/home/bamboo`. You may map a directory on the
host to this directory to store the Bamboo config and database outside of the container. 

This is usefull if you want to start containers using different versions of the image but with the same Bamboo database
and license or if you want to backup this directory on the host. It also allows to upgrade your Bamboo server without
losing your data:

```
docker run -v /data/bamboo-server:/home/bamboo -d hwuethrich/bamboo-server
```

By default, the container downloads and installs Bamboo v5.1.1 on the first boot. To specify which version to install, set
the environment variable `BAMBOO_VERSION`:

```
docker run -e BAMBOO_VERSION=5.1.0 -d hwuethrich/bamboo-server
```

Version 5.1.0 and later should work.

By default, the container runs Bamboo with `supervisord` in the background. If you want to start Bamboo in the foreground
and see the log output, run:

```
docker run hwuethrich/bamboo-server bamboo-server
```

#### Directories

* `/opt/atlassian-bamboo-$BAMBOO_VERSION` - Bamboo installation directory
* `/home/bamboo` - Bamboo home directory (`BAMBOO_HOME`)

#### Environment

* `BAMBOO_HOME` - Bamboo home directory (default `/home/bamboo`)
* `BAMBOO_VERSION` - The version to install an run (default `5.1.1`) 

#### Ports

* `8085` - Bamboo admin interface
* `54663` - Bamboo agent server

## bamboo-agent

Derived from the `java` image. Runs Bamboo Agent using `supervisord`. On the first start it downloads and installs the agent from the Bamboo server
defined in `BAMBOO_SERVER`.

#### Usage

```
docker run -e BAMBOO_SERVER=http://<myserver>:8085 -d bamboo-agent
```

## bamboo-agent-ruby

Derived from the `bamboo-agent` image. Installs Ruby 2.0.0 p247 using `rbenv`.  Adds shims for `ruby`, `rake` 
and `bundler` as agent capabiliy commands.

#### Usage

```
docker run -e BAMBOO_SERVER=http://<host>:8085 -d bamboo-agent-ruby
```


