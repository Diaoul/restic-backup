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

## Security
If your system is secure, you should also protect your backups. The sensitive
files installed by `make install-conf` are owned by root with mode 600.

## Usage
Enable and start the timers
```bash
sudo systemctl enable --now restic-backup.timer
sudo systemctl enable --now restic-forget.timer
```

Verify the status, e.g.
```bash
sudo systemctl list-timers
sudo systemctl status restic-backup.service
```

For ease of use I created a [wrapper](https://github.com/Diaoul/dotfiles/blob/main/.local/bin/restic-wrapper.sh)
script that will load the configuration before calling restic.
Then I just call `sudo restic-wrapper.sh check`.

## Thanks
I used inspiration from all over internet, so thank you internet! :handshake:

In particular:

* https://github.com/erikw/restic-systemd-automatic-backup
* https://github.com/larsks/restic-systemd-units
