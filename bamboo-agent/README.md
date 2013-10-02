# Image `bamboo-agent`

Runs Bamboo Agent using `supervisord`. On the first start it downloads and installs the agent from the Bamboo server defined in `BAMBOO_SERVER`. Based on image [`hwuethrich/java`](../java).

## Usage

```
docker pull hwuethrich/bamboo-agent
docker run -e BAMBOO_SERVER=http://<myserver>:8085 -d hwuethrich/bamboo-agent
```

## Directories

* `/home/bamboo` - Bamboo home directory

## Variables

* `BAMBOO_SERVER` - URL of the Bamboo admin interface (**required**)