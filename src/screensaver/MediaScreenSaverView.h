#import <ScreenSaver/ScreenSaver.h>

#define CASE_COMMAND(key, value) case key: \
    command = value; \
    break;

@interface MoeScreenSaverView : ScreenSaverView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview;

@end
