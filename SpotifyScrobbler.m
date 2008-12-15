//
//  SpotifyScrobbler.m
//  SpotifyScrobbler
//
//  Created by George on 14/12/2008.
//  Copyright 2008 George Brocklehurst. Some rights reserved (see accompanying LICENSE file for details).
//

#import <Foundation/Foundation.h>

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

- (void)nowPlayingTrack:(NSString*)trackName byArtist:(NSString*)artist length:(unsigned int)length
{
	//TODO: Send "now playing" information
	NSLog(@"++++++++++++++++++++ Should tell last.fm \"%@\" by %@ is now playing", trackName, artist);
	
	//TEMP: Tell the local Last.fm player that we've started a new track
	
	[input close];
	[output close];
	
	[input release], input = nil;
	[output release], output = nil;
	
	[NSStream getStreamsToHost:[NSHost hostWithAddress:@"127.0.0.1"] port:33367 inputStream:&input outputStream:&output];
	
	[input setDelegate:self];
	[input scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	[input open];
	[input retain];
	
	[output setDelegate:self];
	[output scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	[output open];
	[output retain];

	NSString *message = [NSString stringWithFormat:@"START a=%@&t=%@&b=&l=%d&p=&c=\n", artist, trackName, length];	
	NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
	int bytesWritten = [output write:[data bytes] maxLength:[data length]];
	NSLog(@"++++++++++++++++++++ Sent %d bytes of %d", bytesWritten, [data length]);
}

- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
{	
	if(eventCode == NSStreamEventOpenCompleted)
		NSLog(@"++++++++++++++++++++ Connection to Last.fm app opened");

	if(eventCode == NSStreamEventHasBytesAvailable)
	{
		uint8_t buffer[2048];
		int actuallyRead = [(NSInputStream*)aStream read:(uint8_t *)buffer maxLength:2048];
		NSData *readData = [NSData dataWithBytes:buffer length:actuallyRead];
		NSString *readString = [[NSString alloc] initWithData:readData encoding:NSUTF8StringEncoding];
		NSLog(@"++++++++++++++++++++ Last.fm app responded with: %@", readString);
		[readString release];
	}
}

- (void)scrobbleTrack:(NSString*)trackName byArtist:(NSString*)artist
{
	//TODO: Scrobble the track
	NSLog(@"++++++++++++++++++++ Should scrobble \"%@\" by %@", trackName, artist);
}

@end
