# Bamboo Server

Docker image to install [Atlassian Bamboo](https://www.atlassian.com/software/bamboo) and run the server using [supervisord](http://supervisord.org/).

## Usage

It's as simple as:

```
docker pull hwuethrich/bamboo-server
docker run -d hwuethrich/bamboo-server
```

### Customize exposed ports

By default, the ports `8085` (admin interface) and `54663` (agent server) are mapped to random ports on the docker host. To customize, run:

```
docker run -p 8085:8085 -p 54663:54663 hwuethrich/bamboo-server
```

If you want to use Bamboo remote agents, make sure to set the public port (and hostname) in the Bamboo settings (or directly in `/home/bamboo/bamboo.cfg.xml`).

More info about port redirection can be found in the official Docker [documentation](http://docs.docker.io/en/latest/use/port_redirection/).

### Persist `BAMBOO_HOME` on the docker host

By default the Bamboo config and database is stored in the container in `/home/bamboo`. You may map a directory on the
host to this directory to store the Bamboo config and database outside of the container.

This is useful if you want to start containers using different versions of the image but
with the same Bamboo database and license or if you want to backup this directory on the
host. It also allows you to upgrade your Bamboo server without losing your data:

```
docker run -v /data/bamboo-server:/home/bamboo -d hwuethrich/bamboo-server
```

### Running a different Bamboo version

By default, the container downloads and installs Bamboo v5.4 on the first boot. To specify which version to install, set the environment variable `BAMBOO_VERSION`:

```
docker run -e BAMBOO_VERSION=5.2 -d hwuethrich/bamboo-server
```

Version 5.1.0 and later should work.

### Combined options

The following example shows the options I use for our CI environment:

```
docker run -name bamboo-server \
  -e TZ=Europe/Zurich -e JAVA_OPTS=-Xmx1024m -e BAMBOO_VERSION=5.2 \
  -v /opt/bamboo-server:/home/bamboo -p 8085:8085 -p 54663:54663 \
  -d hwuethrich/bamboo-server
```

### Debugging

By default, the container runs Bamboo with `supervisord` in the background. If you want to start Bamboo in the foreground
and see the log output, run:

```
docker run -t -i hwuethrich/bamboo-server /start/bamboo-server
```

## Directories

* `/opt/atlassian-bamboo-$BAMBOO_VERSION` - Bamboo installation directory
* `/home/bamboo` - Bamboo home directory (`BAMBOO_HOME`)

## Variables

* `BAMBOO_HOME` - Bamboo home directory (default `/home/bamboo`)
* `BAMBOO_VERSION` - The version to install an run (default `5.1.1`)

## Exposed ports

* `8085` - Bamboo admin interface
* `54663` - Bamboo agent server
