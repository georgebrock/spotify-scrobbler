# Spotify Scrobbler

A SIMBL plugin that adds Last.fm Scrobbling capabilities to Spotify.
Built (well, started anyway) at the Last.fm Hack Day 2008.

## Already done:

* Plugin loads with Spotify
* Plugin detects a change of track
* Plugin extracts metadata about the current track (Track name, artist name and length)
* Plugin observes how long the previous track was playing for (not ideal, doesn't take pauses into account, but this is a hack)
* Plugin checks if it appropriate to scrobble or not (Scobble when a track ends if: it was more than 30s long and at least half or 240s has been played)
* Plugin adds a menu item to Spotify's dock menu for Last.fm login
* Scrobbling via the Last.fm desktop app

## Still to do:

### Improve current delegated scrobbling

* Tell last.fm when the music has stopped (at the very least when the app quits)

### Perform own scrobbling

* Hook Last.fm login dock menu item up to a method
* Add GUI for Last.fm login
* Handshake with Last.fm server
* Scrobble tracks (stub method already called at appropriate times)
* Send "now playing" state to Last.fm (stub method already called at appropriate times)

