# docker-mpd

Docker image for running [mpd](https://www.musicpd.org) using an external
[pulseaudio](https://www.freedesktop.org/wiki/Software/PulseAudio/) server.

# Internals

## User

MPD will run with uid 1000.

## Volumes

* `/music`: mpd music directory (can be mounted in read only)
* `/playlists`: mpd playlists directory
* `/var/lib/mpd`: mpd's home directory (used for persistance and/or for custom
config)

## Ports

6600

# Example

Pulse server with cookie authentification.

```
docker run -v $HOME/music:/music:ro \
	-v $HOME/.config/pulse/cookie:/cookie:ro \
	-p 6600:6600 \
	-e PULSE_COOKIE=/cookie \
	-e PULSE_SERVER=speakers.local \
	--name mpd xdbob/mpd
```
