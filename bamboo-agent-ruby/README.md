# Image `bamboo-agent-ruby`

Installs Ruby 2.0.0 p247 using `rbenv`. Adds shims for `ruby`, `rake` and `bundler` 
as agent capability commands. Based on image [`hwuethrich/bamboo-agent`](../bamboo-agent).

## Usage

To start the agent, simple run

```
docker pull hwuethrich/bamboo-agent-ruby
docker run -e BAMBOO_SERVER=http://<host>:8085 -d hwuethrich/bamboo-agent-ruby
```