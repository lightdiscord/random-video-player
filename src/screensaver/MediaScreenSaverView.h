#import <Foundation/Foundation.h>
#import <ScreenSaver/ScreenSaver.h>
#import <WebKit/WebKit.h>

#define CASE_COMMAND(key, value) case key: \
    command = value; \
    break;

@interface MoeScreenSaverView : ScreenSaverView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview;

@end
