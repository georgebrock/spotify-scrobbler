//
//  SPController+SpotifyScrobbler.m
//  SpotifyScrobbler
//
//  Created by George on 14/12/2008.
//  Copyright 2008 George Brocklehurst. Some rights reserved (see accompanying LICENSE file for details).
//

#import "SPController+SpotifyScrobbler.h"
#import "SpotifyScrobbler.h"

@interface SPController (DummyReplacedMethods)
- (NSMenu*)_original_applicationDockMenu:(id)sender;
@end

@implementation SPController (SpotifyScrobbler)

+ (void)initScrobbler:(SpotifyScrobbler*)plugin
{
	[SpotifyScrobbler renameSelector:@selector(applicationDockMenu:) toSelector:@selector(_original_applicationDockMenu:) onClass:[self class]];
	[SpotifyScrobbler renameSelector:@selector(_new_applicationDockMenu:) toSelector:@selector(applicationDockMenu:) onClass:[self class]];
}

- (NSMenu*)_new_applicationDockMenu:(id)sender
{
	NSMenu *menu = [self _original_applicationDockMenu:sender];
	
	NSMenuItem *loginItem = [[NSMenuItem alloc] initWithTitle:@"Log in to last.fm" action:@selector(lastFMLogin:) keyEquivalent:@""];
	[loginItem setTarget:[SPController sharedController]];
	
	[menu addItem:[NSMenuItem separatorItem]];
	[menu addItem:loginItem];
	
	[loginItem release], loginItem = nil;
	
	return menu;
}

@end
