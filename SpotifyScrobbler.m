//
//  SpotifyScrobbler.m
//  SpotifyScrobbler
//
//  Created by George on 14/12/2008.
//  Copyright 2008 George Brocklehurst. All rights reserved.
//

#import "SpotifyScrobbler.h"

@implementation SpotifyScrobbler

+ (void)load
{
	SpotifyScrobbler *plugin = [SpotifyScrobbler sharedInstance];
	NSLog(@"Spotify scrobbler installed: %@", plugin);
}

+ (SpotifyScrobbler*)sharedInstance
{
	static SpotifyScrobbler *plugin = nil;
	
	if(!plugin)
		plugin = [[SpotifyScrobbler alloc] init];
		
	return plugin;
}

@end
