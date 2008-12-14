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


/*
struct AlbumInfo;

struct Array<sp::AttributedTextOSX*, sp::AttributedTextOSX* const&, 64, true> {
    struct AttributedTextOSX **_field1;
    unsigned int _field2;
    unsigned int _field3;
};
*/
struct ArtistInfo;
/*
struct AttributedTextOSX;

struct CGImage;

struct ClosurePtr<bool (fastdelegate::detail::GenericClass::*)(sp::NativeTextAreaManager::LinkNotifyType, const sp::String&), bool (*)(sp::NativeTextAreaManager::LinkNotifyType, const sp::String&), bool (*)(sp::NativeTextAreaManager::LinkNotifyType, const sp::String&)> {
    struct GenericClass *_field1;
    struct {
        int *_field1;
    } _field2;
};

struct ClosurePtr<void (fastdelegate::detail::GenericClass::*)(sp::Timer&), void (*)(sp::Timer&), void (*)(sp::Timer&)> {
    struct GenericClass *_field1;
    struct {
        int *_field1;
    } _field2;
};

struct ClosurePtr<void (fastdelegate::detail::GenericClass::*)(unsigned int), void (*)(unsigned int), void (*)(unsigned int)> {
    struct GenericClass *_field1;
    struct {
        int *_field1;
    } _field2;
};

struct FastDelegate1<sp::Timer&, void> {
    struct ClosurePtr<void (fastdelegate::detail::GenericClass::*)(sp::Timer&), void (*)(sp::Timer&), void (*)(sp::Timer&)> _field1;
};

struct FastDelegate1<unsigned int, void> {
    struct ClosurePtr<void (fastdelegate::detail::GenericClass::*)(unsigned int), void (*)(unsigned int), void (*)(unsigned int)> _field1;
};

struct FastDelegate2<sp::NativeTextAreaManager::LinkNotifyType, const sp::String&, bool> {
    struct ClosurePtr<bool (fastdelegate::detail::GenericClass::*)(sp::NativeTextAreaManager::LinkNotifyType, const sp::String&), bool (*)(sp::NativeTextAreaManager::LinkNotifyType, const sp::String&), bool (*)(sp::NativeTextAreaManager::LinkNotifyType, const sp::String&)> _field1;
};
*/
struct FileId {
    unsigned char _field1[20];
};
/*
struct GenericClass;

struct GuiCanvas {
    void **_field1;
};

struct GuiControl;

struct GuiEditBox {
    void **_field1;
    unsigned int _field2;
    unsigned char _field3;
    unsigned char _field4;
    unsigned int _field5;
    struct GuiSpecPos _field6;
    struct Rect _field7;
    struct GuiManager *_field8;
    struct GuiControl *_field9;
    struct GuiControl *_field10;
    struct GuiControl *_field11;
    struct GuiEditBoxPriv *_field12;
    struct String _field13;
    struct String _field14;
    _Bool _field15;
    _Bool _field16;
    _Bool _field17;
};

struct GuiEditBoxPriv;

struct GuiManager;

struct GuiSpecPos {
    short left;
    short top;
    short width;
    short height;
    short fill;
};

struct IGenericView;

struct IPopupMenu {
    void **_field1;
};
*/
struct MusicFormat {
    unsigned char _field1;
    unsigned char _field2;
    unsigned char _field3;
    unsigned char _field4;
    int _field5;
};
/*
struct NativeTextAreaManagerOSX {
    void **_field1;
    long _field2;
    struct Rect _field3;
    struct Point _field4;
    struct Array<sp::AttributedTextOSX*, sp::AttributedTextOSX* const&, 64, true> _field5;
    id _field6;
    struct FastDelegate2<sp::NativeTextAreaManager::LinkNotifyType, const sp::String&, bool> _field7;
};

struct OpaqueSecKeychainItemRef;

struct PestoView;

struct PestoWindow {
    void **_field1;
    struct Rect _field2;
    struct PestoView *_field3;
    struct PestoView *_field4;
    struct PestoView *_field5;
    unsigned char _field6;
    struct GuiCanvas *_field7;
    void *_field8;
};

struct Point {
    int _field1;
    int _field2;
};

struct PopupMenuOSX {
    void **_field1;
    id _field2;
};

struct PurchaseLinks;

struct Rect {
    int left;
    int top;
    int right;
    int bottom;
};
*/
struct RefPtr_AlbumInfo {
    struct AlbumInfo *_field1;
};

struct RefPtr_ArtistInfo {
    struct ArtistInfo *_field1;
};

struct RefPtr_TrackInfo {
    struct TrackInfo *_field1;
};
/*
struct SkinManager;

struct StrCtx2;

struct String {
    struct StrCtx2 *_d;
};

struct Timer {
    struct TimerManager *_field1;
    struct FastDelegate1<sp::Timer&, void> _field2;
    unsigned int _field3;
    unsigned int _field4;
    struct Timer *_field5;
};

struct TimerManager;
*/
struct TrackId {
    unsigned char _field1[16];
};

struct VersionAndExpiry {
    unsigned int _field1;
    unsigned int _field2;
};

struct TrackInfo {
    void **_field1;
    long _field2;
    char *_field3;
    unsigned int _field4;
    struct TrackId _field5;
    struct FileId _field6;
    struct MusicFormat _field7;
    struct RefPtr_ArtistInfo _field8;
    struct ArtistInfo **_field9;
    struct RefPtr_AlbumInfo _field10;
    struct RefPtr_TrackInfo _field11;
    unsigned char _field12;
    unsigned char _field13;
    unsigned int :2;
    unsigned int :1;
    unsigned int :1;
    unsigned int :1;
    unsigned int :1;
    unsigned int :1;
    unsigned int :1;
    unsigned char _field14;
    unsigned char _field15;
    struct VersionAndExpiry _field16;
    struct PurchaseLinks *_field17;
};

/*
struct WindowControllerOSX {
    void **_field1;
    void **_field2;
    struct GuiManager *_field3;
    struct WindowSettings _field4;
    struct IGenericView *_field5;
    int _field6;
    struct String _field7;
    struct String _field8;
    int _field9;
    struct SkinManager *_field10;
    struct Timer _field11;
    struct Timer _field12;
    struct String _field13;
    void **_field14;
    id _field15;
    _Bool _field16;
    id _field17;
};

struct WindowSettings {
    struct Rect _field1;
    int _field2;
};

struct _NSPoint {
    float x;
    float y;
};

struct _NSRange {
    unsigned int location;
    unsigned int length;
};

struct _NSRect {
    struct _NSPoint origin;
    struct _NSSize size;
};

struct _NSSize {
    float width;
    float height;
};

struct _NSZone;

typedef struct {
    int *_field1;
} CDAnonymousStruct1;


*/


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

/*
method_types 0x0013cda8 v12@0:4^{
	TrackInfo=^^?l*I
		{TrackId=[16C]}
		{FileId=[20C]}
		{MusicFormat=CCCCi}
		{RefPtr<sp::ArtistInfo>=^{ArtistInfo}}^^{ArtistInfo}
		{RefPtr<sp::AlbumInfo>=^{AlbumInfo}}
		{RefPtr<sp::TrackInfo>=^{TrackInfo}}
		CCb2b1b1b1b1b1b1CC
		{VersionAndExpiry=II}^
		{PurchaseLinks}
	}8
*/

@end
