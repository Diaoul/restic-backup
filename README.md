# Restic Backup
Minimalist restic backup with systemd.

This repository aims to provide simple and working example of how to run restic
with systemd. There is no fancy notification, no complex installation scripts,
just a few files easy to maintain and edit as required.

It is assumed that you know your way around both [restic](https://restic.net/)
and [systemd](https://www.freedesktop.org/wiki/Software/systemd/).

## Installation
Install the systemd files with:
```bash
sudo make install
```

Install the configuration example with:
```bash
sudo make install-conf
```
**Warning:** this will overwrite any previous configuration!

The Makefile honors the `DESTDIR` environment variable so if you want to
install it somewhere else to test things out, just run:
```bash
DESTDIR=/tmp/test make install
```

## Configuration
The configuration is done by passing variables in `/etc/restic/restic.conf` to
restic as environment variables with systemd. Edit this file as needed.

Edit the timers in `/etc/systemd/system/restic-*.timer` to adjust the backup
frequency.

Edit the services in `/etc/systemd/system/restic-*.service` to change restic
arguments or clean up policy.

## Thanks
I used inspiration from all over internet, so thank you internet! :handshake:

In particular:

* https://github.com/erikw/restic-systemd-automatic-backup
* https://github.com/larsks/restic-systemd-units
