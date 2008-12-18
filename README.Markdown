# Spotify Scrobbler

A SIMBL plugin that adds Last.fm Scrobbling capabilities to Spotify.
Built (well, started anyway) at the Last.fm Hack Day 2008.

## Important note:

As of 18th December 2008 [Spotify has built in scrobbling support](http://www.spotify.com/blog/archives/2008/12/18/spotify-scrobbles/).

## Usage:

1. Download and install [SIMBL](http://www.culater.net/software/SIMBL/SIMBL.php)
2. Download and install the [Last.fm desktop application](http://www.last.fm/download) (This won't always be required, but it is for the moment)
3. Download this project
4. Copy build/Release/SpotifyScrobbler.bundle to ~/Library/Application Support/SIMBL/Plugins/
5. Launch the Last.fm application
6. Launch Spotify

## Already done:

* Plugin loads with Spotify
* Plugin detects a change of track
* Plugin extracts metadata about the current track (Track name, artist name and length)
* Plugin observes how long the previous track was playing for (not ideal, doesn't take pauses into account, but this is a hack)
* Plugin checks if it appropriate to scrobble or not (Scobble when a track ends if: it was more than 30s long and at least half or 240s has been played)
* Plugin adds a menu item to Spotify's dock menu for Last.fm login
* Scrobbling via the Last.fm desktop app

## Still to do:

I won't be working on these items, because Spotify now has it's own scrobbler.

### Improve current delegated scrobbling

* Tell last.fm when the music has stopped (at the very least when the app quits)

### Perform own scrobbling

* Hook Last.fm login dock menu item up to a method
* Add GUI for Last.fm login
* Handshake with Last.fm server
* Scrobble tracks (stub method already called at appropriate times)
* Send "now playing" state to Last.fm (stub method already called at appropriate times)

## Small print ##

This Scrobbler was built quickly at a Hack Day, there's not been a lot of time spent on testing etc. I'm happy to use it, but if you decide to use it too you do so at your own risk.
