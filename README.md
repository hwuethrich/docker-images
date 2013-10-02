# Images for [docker.io](http://docker.io)

My collection of docker images. See [here](https://index.docker.io/u/hwuethrich/) for how to get them.

## base

Basic image with `curl`, `wget`, `git-core`, `vim`, `htop` and `supervisor`. Currently uses 
the [Hetzner](http://www.hetzner.de) Ubuntu repository, because thats where im running docker.

The default CMD is `start`, which adds the current hostname to `/etc/hosts` and runs `supervisord`. 
Additional services may be added to `/etc/supervisor/conf.d/`.

## java

Derived from the `base` image. Installs Java from the webupd8team PPA.

## bamboo-server

Derived from the `java` image. Downloads and installs [Atlassian Bamboo](https://www.atlassian.com/software/bamboo) 
and runs the server using `supervisord`.

#### Usage

```
docker run -d bamboo-server
```

You may persist all Bamboo data outside of the container by mapping a volume to `/home/bamboo`:

```
docker run -p 8085:8085 -p 54663:54663 -v /data/bamboo-server:/home/bamboo -d bamboo-server
```

By default it installs v5.1.1. To specify which version to install, set the environment 
variable `BAMBOO_VERSION`:

```
docker run -e BAMBOO_VERSION=5.1.0 -d hwuethrich/bamboo-server
```

#### Directories

* `/opt/atlassian-bamboo-5.1.1` - Bamboo installation directory
* `/opt/atlassian-bamboo` - Symlink to above

#### Environment

* `BAMBOO_HOME` - Bamboo home directory. Default is `/home/bamboo`.
* `BAMBOO_VERSION` - The version to install an run (default 5.1.1) 

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


