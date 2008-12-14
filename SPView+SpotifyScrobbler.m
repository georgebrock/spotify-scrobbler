//
//  SPView+SpotifyScrobbler.m
//  SpotifyScrobbler
//
//  Created by George on 14/12/2008.
//  Copyright 2008 George Brocklehurst. All rights reserved.
//

#import "SPView+SpotifyScrobbler.h"
#import "SpotifyScrobbler.h"

@interface SPView (DummyReplacedMethods)
- (BOOL)_original_performKeyEquivalent:(NSEvent *)theEvent;
@end

@implementation SPView (SpotifyScrobbler)

+ (void)initScrobbler:(SpotifyScrobbler*)plugin
{
	[SpotifyScrobbler renameSelector:@selector(performKeyEquivalent:) toSelector:@selector(_original_performKeyEquivalent:) onClass:[self class]];
	[SpotifyScrobbler renameSelector:@selector(_new_performKeyEquivalent:) toSelector:@selector(performKeyEquivalent:) onClass:[self class]];
}

- (BOOL)_new_performKeyEquivalent:(NSEvent *)theEvent
{
	NSLog(@"************************************************ ABOUT TO...");
	BOOL ret = [self _original_performKeyEquivalent:theEvent];
	NSLog(@"************************************************ %@ ...DONE", ret?@"TRUE":@"FALSE");
	return ret;
}

@end
