//
//  GrowlDelegate+SpotifyScrobbler.m
//  SpotifyScrobbler
//
//  Created by George on 14/12/2008.
//  Copyright 2008 George Brocklehurst. All rights reserved.
//

#import "GrowlDelegate+SpotifyScrobbler.h"
#import "SpotifyScrobbler.h"
#import "SpotifyTypes.h"
#import "SPController+SpotifyScrobbler.h"


@interface SPGrowlDelegate (DummyReplacedMethods)
- (void)_original_notificationWithTrackInfo:(void*)info;
@end

@implementation SPGrowlDelegate (SpotifyScrobbler)

+ (void)initScrobbler:(SpotifyScrobbler*)plugin
{
	[SpotifyScrobbler renameSelector:@selector(notificationWithTrackInfo:) toSelector:@selector(_original_notificationWithTrackInfo:) onClass:[self class]];
	[SpotifyScrobbler renameSelector:@selector(_new_notificationWithTrackInfo:) toSelector:@selector(notificationWithTrackInfo:) onClass:[self class]];
}

- (void)_new_notificationWithTrackInfo:(struct TrackInfo*)info
{
	if(info != NULL)
	{
		NSString *songTitle = [NSString stringWithFormat:@"%s", info->_field3];
		NSString *dockTitle = [[[[[SPController sharedController] applicationDockMenu:self] itemArray] objectAtIndex:0] title];
		
		int removeLength = [songTitle length] + 3;
		NSString *artist = [dockTitle stringByReplacingCharactersInRange:NSMakeRange([dockTitle length]-removeLength, removeLength) withString:@""];
		
		NSString *url = [NSString stringWithFormat:@"http://ws.audioscrobbler.com/2.0/?method=track.search&track=%@&artist=%@&api_key=b25b959554ed76058ac220b7b2e0a026", songTitle, artist];
	
		NSLog(@"+++++++++++++++++++++++++ TRACK INFORMATION +++++++++++++++++++++++++");
		NSLog(@"Title:\t%@", songTitle);
		NSLog(@"Artist:\t%@", artist);
		NSLog(@"URL:\t%@", url);
		NSLog(@"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
	}
	
	[self _original_notificationWithTrackInfo:info];
}


@end
