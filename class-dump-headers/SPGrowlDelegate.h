/*
 *     Generated by class-dump 3.1.2.
 *
 *     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2007 by Steve Nygard.
 */

#import "NSObject.h"

#import "GrowlApplicationBridgeDelegate-Protocol.h"

@interface SPGrowlDelegate : NSObject <GrowlApplicationBridgeDelegate>
{
}

+ (void)initialize;
+ (id)sharedInstance;
- (id)registrationDictionaryForGrowl;
- (void)notificationWithTrackInfo:(struct TrackInfo *)fp8;
- (void)growlNotificationWasClicked:(id)fp8;

@end

