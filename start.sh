#!/bin/sh
chown mpd /playlists
chown mpd /var/lib/mpd

exec /usr/bin/dumb-init -- $@
