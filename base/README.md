# Image `hwuethrich/base`

Basic image with `curl`, `wget`, `git-core`, `vim`, `htop` and `supervisor`.

The default CMD `/start/supervisord` sets the local timezone based on the `TZ` environment variable and runs supervisord.

Additional services may be added to `/etc/supervisor/conf.d/`.
