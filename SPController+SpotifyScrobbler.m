//
//  SPController+SpotifyScrobbler.m
//  SpotifyScrobbler
//
//  Created by George on 14/12/2008.
//  Copyright 2008 George Brocklehurst. All rights reserved.
//

#import "SPController+SpotifyScrobbler.h"
#import "SpotifyScrobbler.h"

@interface SPController (DummyReplacedMethods)
- (void)_original_setupWindowAndViews;
//- (void)_original_doAction:(id)action;
@end

@implementation SPController (SpotifyScrobbler)

+ (void)initScrobbler:(SpotifyScrobbler*)plugin
{
	NSLog(@"Initialising SPController extensions...");
	
	[SpotifyScrobbler renameSelector:@selector(setupWindowAndViews) toSelector:@selector(_original_setupWindowAndViews) onClass:[self class]];
	[SpotifyScrobbler renameSelector:@selector(_new_setupWindowAndViews) toSelector:@selector(setupWindowAndViews) onClass:[self class]];
	
	//[SpotifyScrobbler renameSelector:@selector(doAction:) toSelector:@selector(_original_doAction:) onClass:[self class]];
	//[SpotifyScrobbler renameSelector:@selector(_new_doAction:) toSelector:@selector(doAction:) onClass:[self class]];
}

- (void)_new_setupWindowAndViews
{

	[self _original_setupWindowAndViews];
	
	NSLog(@" ******* Called the repalced setupWindowAndViews method!");
	NSLog(@" Main window is: %@", [self mainWindow]);
	NSLog(@" Content view: %@", [[self mainWindow] contentView]);
	NSLog(@" ***************");
}

/*
- (void)_new_doAction:(id)action
{
	[self _original_doAction:action];
	
	NSLog(@" ******* Just did an action: %@", action);
}
*/

@end
