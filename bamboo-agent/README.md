# Bamboo Agent

Docker image to run [Atlassian Bamboo](https://www.atlassian.com/software/bamboo) agent with common DB engines and libraries.

## Motivation

If you are using Bamboo as your CI platform, you probably use [remote agents](https://quickstart.atlassian.com/download/bamboo/get-started/agents/) to run your tests/builds in parallel on separate VMs or even physical servers.             You are probably using something like Chef or Puppet to automate the setup of these agents and install  requirements like database servers, libraries etc. to run your builds in a consistent environment.

At work, we were using Chef to provision 6 agents running in a virtual Xen environment and install PostgreSQL and other dependencies to run the test suites of our various Ruby on Rails projects. Every now and then, agents started to behave strangely and we had to spin-up new ones to replace them. This took us only about 30 minutes and we were quite happy with this setup, although we had to maintain the Chef cookbooks for the setup, which sometimes broke because of changes in newer versions of Chef or the cookbooks we used.

We were also evaluating services like [Travis CI](https://travis-ci.com/) or [Semaphore](https://semaphoreapp.com/) (which are awesome!), but we have one project which is using a Microsoft SQL database, which is not (easily) available on any of these services. We also wanted to parallelize our tests for quicker feedback, which can become quite expensive if you need 8+ workers.

When I discovered [Docker](http://docker.io), I instantly realized how this could reduce the time required to setup and and maintain our CI setup and I started creating images for Bamboo server and remote agents. Thanks to Docker, it took us only 10 minutes to setup a fully functional CI environment with Bamboo server and 10+ agents on a single physical Linux server at [Hetzner](http://www.hetzner.de/) (for just €49/month). Each agent requires only about 500MB of memory and build times went down to about 5 minutes (compared to 20-30 minutes when running as a VM in Xen). 


## Usage

When you start the container for the first time, it downloads the Bamboo agent installer from the Bamboo server. Therefore it should work with any version of Bamboo server. The agent and all other services are then started using [supervisord](http://supervisord.org/).

```
docker pull hwuethrich/bamboo-agent
docker run -e BAMBOO_SERVER=http://<myserver>:8085 -d hwuethrich/bamboo-agent
```

If you don't have an instance of Bamboo server running already, you might want to have a look at my [`bamboo-server`](../bamboo-server) Docker image.

### Variables

* `BAMBOO_SERVER` - URL of the Bamboo Server admin interface (required)

## Stack

Ultimately, the goal is to provide a technology stack similar to [Travis CI](http://about.travis-ci.org/docs/user/ci-environment/) or [Semaphore](http://docs.semaphoreapp.com/supported-stack), but we currently use this image for testing *Ruby on Rails* applications only.

** If there is something missing, PLEASE feel free to open an issue or pull request! Contributions are more than welcome! :)**

### Ruby

* [rbenv](https://github.com/sstephenson/rbenv) - with plugins [ruby-build](https://github.com/sstephenson/ruby-build), [rbenv-gem-rehash](https://github.com/sstephenson/rbenv-gem-rehash)
* [MRI Ruby](https://www.ruby-lang.org/) 1.9.3-p448, 2.0.0-p247, 2.1.0-preview1 (default: 2.0.0)
* [bundler](http://bundler.io/) 1.5.0.rc1

### Java

* [Oracle JDK 7u45](http://www.oracle.com/technetwork/java/javase/downloads/index.html)


### Database engines

* [SQLite](http://www.sqlite.org) 3.8.1
* [PostgreSQL](http://www.postgresql.org) 9.3 from [apt.postgresql.org](http://apt.postgresql.org)<br>
  *User and password is `bamboo`, but you shouldn't have to use them, because [`~/.pgpass`](http://www.postgresql.org/docs/current/static/libpq-pgpass.html) already contains these credentials.*

### Misc

* [Node.js](http://nodejs.org/) 0.6.12
* [PhantomJS](http://phantomjs.org/) 1.9.2
* [FreeTDS](http://www.freetds.org/) 0.91
* [GraphicsMagick](http://www.graphicsmagick.org/) 1.3.12
* [ImageMagick](http://www.imagemagick.org/) 6.6.9-7
* Xvfb


