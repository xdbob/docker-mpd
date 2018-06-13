FROM ubuntu:bionic

RUN apt-get update && apt-get install -y mpd dumb-init
RUN usermod -u 1000 mpd && chown -R mpd /var/lib/mpd

EXPOSE 6600

ADD ["start.sh", "/start.sh"]
ADD ["mpd.conf", "/etc/mpd.conf"]

VOLUME ["/music"]
VOLUME ["/playlists"]
VOLUME ["/var/lib/mpd"]

ENTRYPOINT ["/start.sh"]
CMD ["mpd", "--no-daemon", "--stdout", "-v"]
