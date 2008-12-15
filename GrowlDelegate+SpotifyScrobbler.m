//
//  GrowlDelegate+SpotifyScrobbler.m
//  SpotifyScrobbler
//
//  Created by George on 14/12/2008.
//  Copyright 2008 George Brocklehurst. Some rights reserved (see accompanying LICENSE file for details).
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
	static NSString *previousSongTitle = nil;
	static NSString *previousArtist = nil;
	static unsigned int previousTrackLength = 0;
	static NSTimeInterval startTimeStamp = 0;

	[self _original_notificationWithTrackInfo:info];

	if(info != NULL)
	{
		NSString *songTitle = [NSString stringWithFormat:@"%s", info->_field3];
		unsigned int trackLength = info->_field4;
		
		NSString *dockTitle = [[[[[SPController sharedController] applicationDockMenu:nil] itemArray] objectAtIndex:0] title];
		
		int removeLength = [songTitle length] + 3;
		NSString *artist = [dockTitle stringByReplacingCharactersInRange:NSMakeRange([dockTitle length]-removeLength, removeLength) withString:@""];
		
		if(![artist isEqualToString:previousArtist] || ![songTitle isEqualToString:previousSongTitle])
		{
			[[SpotifyScrobbler sharedInstance] nowPlayingTrack:songTitle byArtist:artist];
		
			NSTimeInterval nowTimeStamp = [[NSDate date] timeIntervalSince1970];
		
			if(previousArtist && previousSongTitle)
			{
				NSTimeInterval timePlayed = nowTimeStamp - startTimeStamp;
			
				NSLog(@"++++++++++++++++++++ FINISHED TRACK INFORMATION +++++++++++++++++++++");
				NSLog(@"Title:           %@", previousSongTitle);
				NSLog(@"Artist:          %@", previousArtist);
				NSLog(@"Track length:    %d seconds", previousTrackLength);
				NSLog(@"Time played:     %.0f seconds", timePlayed);
				NSLog(@"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
				
				if(previousTrackLength > 30 && timePlayed >= 240.0 || timePlayed >= (previousTrackLength / 2.0))
					[[SpotifyScrobbler sharedInstance] scrobbleTrack:previousSongTitle byArtist:previousArtist];
			}
			
			[previousArtist release], previousArtist = [artist retain];
			[previousSongTitle release], previousSongTitle = [songTitle retain];
			previousTrackLength = trackLength;
			startTimeStamp = nowTimeStamp;
		}
	}
}


@end
