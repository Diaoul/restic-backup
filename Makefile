install:
	install -d $(DESTDIR)/var/cache/restic
	install -m 644 restic-backup.service $(DESTDIR)/etc/systemd/system/
	install -m 644 restic-backup.timer $(DESTDIR)/etc/systemd/system/
	install -m 644 restic-forget.service $(DESTDIR)/etc/systemd/system/
	install -m 644 restic-forget.timer $(DESTDIR)/etc/systemd/system/

install-conf:
	install -d $(DESTDIR)/etc/restic
	install -m 600 conf/password $(DESTDIR)/etc/restic/password
	install -m 600 conf/restic.conf $(DESTDIR)/etc/restic/restic.conf
	install -m 644 conf/excludes $(DESTDIR)/etc/restic/excludes
