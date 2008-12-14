//
//  SPController+SpotifyScrobbler.h
//  SpotifyScrobbler
//
//  Created by George on 14/12/2008.
//  Copyright 2008 George Brocklehurst. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SPController.h"
@class SpotifyScrobbler;

@interface SPController (SpotifyScrobbler) 

+ (void)initScrobbler:(SpotifyScrobbler*)plugin;

@end
