# Images for [docker.io](http://docker.io)

My collection of docker images. Also see my profile on [index.docker.io](https://index.docker.io/u/hwuethrich/).

## Generic

#### [`base`](/base)

Base image with `curl`, `wget`, `git-core`, `vim`, `htop` and `supervisor`

#### [`java`](/java)

Base image with Java from the webupd8team PPA.

## Atlassian Bamboo

#### [`bamboo-server`](/bamboo-server)

Runs [Atlassian Bamboo](https://www.atlassian.com/software/bamboo) with `supervisor`

#### [`bamboo-agent`](/bamboo-agent)

Runs Bamboo Agent using `supervisor`

#### [`bamboo-ruby`](/bamboo-ruby)

Same as `bamboo-agent` but with `rbenv`. Does **not** install any rubies!

#### [`bamboo-ruby-extra`](/bamboo-ruby-extra)

Rubies and common packages and services (phantomjs, postgresql, ...)

## Contributions

Are always welcome! :) Just fork and send me a pull request.
