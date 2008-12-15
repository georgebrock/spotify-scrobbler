//
//  SpotifyScrobbler.h
//  SpotifyScrobbler
//
//  Created by George on 14/12/2008.
//  Copyright 2008 George Brocklehurst. Some rights reserved (see accompanying LICENSE file for details).
//

#import <Cocoa/Cocoa.h>

@interface SpotifyScrobbler : NSObject 
{
}

+ (void)load;
+ (SpotifyScrobbler*)sharedInstance;

+ (BOOL)renameSelector:(SEL)originalSelector toSelector:(SEL)newSelector onClass:(Class)class;

- (void)nowPlayingTrack:(NSString*)trackName byArtist:(NSString*)artist;
- (void)scrobbleTrack:(NSString*)trackName byArtist:(NSString*)artist;

@end
