//
//  SPView+SpotifyScrobbler.h
//  SpotifyScrobbler
//
//  Created by George on 14/12/2008.
//  Copyright 2008 George Brocklehurst. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SPView.h"
@class SpotifyScrobbler;

@interface SPView (SpotifyScrobbler)

+ (void)initScrobbler:(SpotifyScrobbler*)plugin;

@end
