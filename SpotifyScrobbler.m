//
//  SpotifyScrobbler.m
//  SpotifyScrobbler
//
//  Created by George on 14/12/2008.
//  Copyright 2008 George Brocklehurst. All rights reserved.
//

#import "SpotifyScrobbler.h"
#import "SPController+SpotifyScrobbler.h"
#import "SPApplication+SpotifyScrobbler.h"
#import "SPView+SpotifyScrobbler.h"
#import "GrowlDelegate+SpotifyScrobbler.h"
#import <objc/objc-class.h>


@implementation SpotifyScrobbler

+ (void)load
{
	SpotifyScrobbler *plugin = [SpotifyScrobbler sharedInstance];
	[SPController initScrobbler:plugin];
	[SPApplication initScrobbler:plugin];
	[SPView initScrobbler:plugin];
	[SPGrowlDelegate initScrobbler:plugin];
	
	//[NSBundle loadNibNamed:@"Test" owner:plugin];
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

- (IBAction)test:(id)sender
{
	NSLog(@"////////////////////////////////////////");
	SPController *c = [SPController sharedController];
	NSWindow *mainWin = [c mainWindow];
	[self displayView:[mainWin contentView] level:0];
	NSLog(@"////////////////////////////////////////");
}

+ (SpotifyScrobbler*)sharedInstance
{
	static SpotifyScrobbler *plugin = nil;
	
	if(!plugin)
		plugin = [[SpotifyScrobbler alloc] init];
		
	return plugin;
}

+ (BOOL)renameSelector:(SEL)originalSelector toSelector:(SEL)newSelector onClass:(Class)class
{
	Method method = nil;

	method = class_getInstanceMethod(class, originalSelector);
	if (method == nil)
			return NO;

	method->method_name = newSelector;
	return YES;
}

+ (void)listInstanceVars:(Class)class
{
	unsigned int i, len = 0;
	Ivar *ivars = class_copyIvarList(class, &len);
	for(i = 0; i < len; i++)
	{
		NSLog(@" - %s", ivar_getName(ivars[i]));
	}
}

@end
