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
- (id)_original_view:(NSView*)view stringForToolTip:(id)str point:(NSPoint)pt userData:(id)userData;
@end

@implementation SPView (SpotifyScrobbler)

+ (void)initScrobbler:(SpotifyScrobbler*)plugin
{
	[SpotifyScrobbler renameSelector:@selector(performKeyEquivalent:) toSelector:@selector(_original_performKeyEquivalent:) onClass:[self class]];
	[SpotifyScrobbler renameSelector:@selector(_new_performKeyEquivalent:) toSelector:@selector(performKeyEquivalent:) onClass:[self class]];
	
	[SpotifyScrobbler renameSelector:@selector(view:stringForToolTip:point:userData:) toSelector:@selector(_original_view:stringForToolTip:point:userData:) onClass:[self class]];
	[SpotifyScrobbler renameSelector:@selector(_new_view:stringForToolTip:point:userData:) toSelector:@selector(view:stringForToolTip:point:userData:) onClass:[self class]];
}

- (BOOL)_new_performKeyEquivalent:(NSEvent *)theEvent
{
	//NSLog(@"************************************************ ABOUT TO...");
	BOOL ret = [self _original_performKeyEquivalent:theEvent];
	//NSLog(@"************************************************ %@ ...DONE", ret?@"TRUE":@"FALSE");
	return ret;
}

- (id)_new_view:(NSView*)view stringForToolTip:(id)str point:(NSPoint)pt userData:(id)userData
{
	//NSLog(@"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! %@", str);
	return [self _original_view:view stringForToolTip:str point:pt userData:userData];
}

@end
