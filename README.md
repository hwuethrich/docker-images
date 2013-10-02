# Images for [docker.io](http://docker.io)

My collection of docker images. Also see my profile on [index.docker.io](https://index.docker.io/u/hwuethrich/).

| Image                                   | Parent       | Description                        |
|-----------------------------------------|--------------|------------------------------------|
| [**base**](/base)                           | ubuntu       | Basic image with `curl`, `wget`, `git-core`, `vim`, `htop` and `supervisor`
| [**java**](/java)                           | base         | Base image with Java from the webupd8team PPA
| [**bamboo-server**](/bamboo-server)         | java         | Runs [Atlassian Bamboo](https://www.atlassian.com/software/bamboo) with `supervisor`
| [**bamboo-agent**](/bamboo-agent)           | java         | Runs Bamboo Agent using `supervisor`
| [**bamboo-agent-ruby**](/bamboo-agent-ruby) | bamboo-agent | Installs Ruby 2.0.0 p247 using `rbenv` and generates agent capabilities.

## Contributions

Are always welcome! :) Just fork and send me a pull request.