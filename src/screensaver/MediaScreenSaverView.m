#import "MediaScreenSaverView.h"
#import <Carbon/Carbon.h>
#import <WebKit/WebKit.h>

@interface MoeScreenSaverView ()
@end

@implementation MoeScreenSaverView {
	WKWebView *webview;
    BOOL _isPreview;
}

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        _isPreview = isPreview;
    }
    return self;
}

#pragma mark ScreenSaverView

- (void)startAnimation {
    [super startAnimation];
    
    webview = [[WKWebView alloc] initWithFrame:[self bounds]];
    [webview setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
    [webview setAutoresizesSubviews:YES];
    
    [self addSubview:webview];
    
    if (!_isPreview) {
        [self loadFromStart];
    }
}

#pragma mark Loading URLs

- (void)loadFromStart {
	NSURL *url = [NSURL URLWithString:@"http://localhost:8000"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];

	[webview loadRequest:request];
}

#pragma mark Focus Overrides

- (void)keyDown:(NSEvent *)theEvent {
    NSString *command = NULL;

    switch (theEvent.keyCode) {
        CASE_COMMAND(kVK_ANSI_N, @"next()");
    }

    if (command) {
		[webview evaluateJavaScript:command completionHandler:NULL];
    }
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (BOOL)resignFirstResponder {
    return NO;
}

@end
