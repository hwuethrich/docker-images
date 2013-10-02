# Image `hwuethrich/base`

Basic image with `curl`, `wget`, `git-core`, `vim`, `htop` and `supervisor`.

The default CMD is a script `/usr/local/bin/start`, which adds the current hostname to `/etc/hosts` and runs `supervisord`.

Additional services may be added to `/etc/supervisor/conf.d/`.