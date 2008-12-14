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
- (void)_original_doAction:(id)action;
- (void)_original_observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context;
- (void)_original_notificationDelivery:(id)notification;
- (void)_original_openLink:(id)link userData:(id)data error:(NSError**)err;
- (void)_original_getURI:(id)uri withReplyEvent:(id)reply;
@end

@implementation SPController (SpotifyScrobbler)

+ (void)initScrobbler:(SpotifyScrobbler*)plugin
{
	//NSLog(@"Initialising SPController extensions...");
	
	[SpotifyScrobbler renameSelector:@selector(setupWindowAndViews) toSelector:@selector(_original_setupWindowAndViews) onClass:[self class]];
	[SpotifyScrobbler renameSelector:@selector(_new_setupWindowAndViews) toSelector:@selector(setupWindowAndViews) onClass:[self class]];
	
	[SpotifyScrobbler renameSelector:@selector(observeValueForKeyPath:ofObject:change:context:) toSelector:@selector(_original_observeValueForKeyPath:ofObject:change:context:) onClass:[self class]];
	[SpotifyScrobbler renameSelector:@selector(_new_observeValueForKeyPath:ofObject:change:context:) toSelector:@selector(observeValueForKeyPath:ofObject:change:context:) onClass:[self class]];
	
	[SpotifyScrobbler renameSelector:@selector(notificationDelivery:) toSelector:@selector(_original_notificationDelivery:) onClass:[self class]];
	[SpotifyScrobbler renameSelector:@selector(_new_notificationDelivery:) toSelector:@selector(notificationDelivery:) onClass:[self class]];
	
	[SpotifyScrobbler renameSelector:@selector(openLink:userData:error:) toSelector:@selector(_original_openLink:userData:error:) onClass:[self class]];
	[SpotifyScrobbler renameSelector:@selector(_new_openLink:userData:error:) toSelector:@selector(openLink:userData:error:) onClass:[self class]];
	
	[SpotifyScrobbler renameSelector:@selector(doAction:) toSelector:@selector(_original_doAction:) onClass:[self class]];
	[SpotifyScrobbler renameSelector:@selector(_new_doAction:) toSelector:@selector(doAction:) onClass:[self class]];
	
	[SpotifyScrobbler renameSelector:@selector(getURI:withReplyEvent:) toSelector:@selector(_original_getURI:withReplyEvent:) onClass:[self class]];
	[SpotifyScrobbler renameSelector:@selector(_new_getURI:withReplyEvent:) toSelector:@selector(getURI:withReplyEvent:) onClass:[self class]];
}

- (void)_new_getURI:(id)uri withReplyEvent:(id)reply
{
	//NSLog(@"******************* getURI:withReplyEvent:");
	[self _original_getURI:uri withReplyEvent:reply];
}

- (void)_new_setupWindowAndViews
{

	[self _original_setupWindowAndViews];
	/*
	NSLog(@" ******* Called the repalced setupWindowAndViews method!");
	NSLog(@" Main window is: %@", [self mainWindow]);
	NSLog(@" Content view: %@", [[self mainWindow] contentView]);
	
	NSArray *subviews = [[[self mainWindow] contentView] subviews];
	NSLog(@" Subview count: %d", [subviews count]);
	NSEnumerator *viewEnum = [subviews objectEnumerator];
	NSView *v;
	while(v = [viewEnum nextObject])
	{
		NSLog(@" - %@", v);
	}
	
	NSLog(@"Main menu: %@", [[NSApp mainMenu] itemArray]);
	
	NSLog(@"Responds to a KVO selector? %@", ([self respondsToSelector:@selector(observeValueForKeyPath:ofObject:change:context:)]?@"TRUE":@"FALSE"));
	
	NSLog(@" ***************");
	*/
}

- (void)displayView:(NSView*)view level:(int)level
{
	NSLog(@"L%d %@ : %@", level, [view class], [view superclass]);
	if([view isKindOfClass:[NSTextView class]])
		NSLog(@"   Text: \"%@\"", [[(NSTextView*)view textStorage] string]);

	NSArray *subviews = [view subviews];
	NSEnumerator *viewEnum = [subviews objectEnumerator];
	NSView *v;
	while(v = [viewEnum nextObject])
		[self displayView:v level:(level+1)];
}

- (void)_new_doAction:(id)action
{

	//NSLog(@" ******* Just did an action: %@ %@ %@", action, [action target], NSStringFromSelector([(NSMenuItem*)action action]));
	[self _original_doAction:action];
	
	//[self displayView:[[self mainWindow] contentView] level:0];
	
	//[[[[[self mainWindow] contentView] subviews] objectAtIndex:0] setHidden:TRUE];
	
	/*
	NSArray *subviews = [[[self mainWindow] contentView] subviews];
	NSLog(@" Subview count: %d", [subviews count]);
	NSEnumerator *viewEnum = [subviews objectEnumerator];
	NSView *v;
	while(v = [viewEnum nextObject])
	{
		NSLog(@" - %@", v);
		NSArray *subsub = [v subviews];
		NSEnumerator *subE = [subsub objectEnumerator];
		NSView *sv;
		while(sv = [subE nextObject])
			NSLog(@"   - %@", ([sv isKindOfClass:[NSTextView class]] ? [[(NSTextView*)sv textStorage] string] : sv));
	}
	*/
	
}

- (void)_new_observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	//NSLog(@"*********** KVO baby!");
	[self _original_observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

- (void)_new_notificationDelivery:(id)notification
{
	//NSLog(@"*********** Notification delivery: %@", notification);
	[self _original_notificationDelivery:notification];
}

- (void)_new_openLink:(id)link userData:(id)data error:(NSError**)err
{
	//NSLog(@"************ Open link %@", link);
	[self _original_openLink:link userData:data error:err];
}

@end
