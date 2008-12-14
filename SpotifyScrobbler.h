//
//  SpotifyScrobbler.h
//  SpotifyScrobbler
//
//  Created by George on 14/12/2008.
//  Copyright 2008 George Brocklehurst. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface SpotifyScrobbler : NSObject 
{
}

+ (void)load;
+ (SpotifyScrobbler*)sharedInstance;

+ (BOOL)renameSelector:(SEL)originalSelector toSelector:(SEL)newSelector onClass:(Class)class;

@end
