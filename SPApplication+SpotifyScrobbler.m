//
//  SPApplication+SpotifyScrobbler.m
//  SpotifyScrobbler
//
//  Created by George on 14/12/2008.
//  Copyright 2008 George Brocklehurst. All rights reserved.
//

#import "SPApplication+SpotifyScrobbler.h"
#import "SpotifyScrobbler.h"

@interface SPApplication (DummyReplacedMethods)
- (void)_original_sendEvent:(id)event;
@end

@implementation SPApplication (SpotifyScrobbler)

+ (void)initScrobbler:(SpotifyScrobbler*)plugin
{
	NSLog(@"Initialising SPController extensions...");
	
	[SpotifyScrobbler renameSelector:@selector(sendEvent:) toSelector:@selector(_original_sendEvent:) onClass:[self class]];
	[SpotifyScrobbler renameSelector:@selector(_new_sendEvent:) toSelector:@selector(sendEvent:) onClass:[self class]];
}

- (void)_new_sendEvent:(id)event
{
	//NSLog(@"************** Application send event: %@", event);
	[self _original_sendEvent:(id)event];
	//NSLog(@"////////////// Application send event: %@", event);
}

@end
