//
//  RCTPrivacySnapshot.m
//  RCTPrivacySnapshot
//
//  Created by Roger Chapman on 7/10/2015.
//  Copyright © 2015 Kayla Technologies. All rights reserved.
//

#import "RCTPrivacySnapshot.h"

@implementation RCTPrivacySnapshot {
    BOOL enabled;
    UIVisualEffectView *obfuscatingView;
}

RCT_EXPORT_MODULE();

#pragma mark - Lifecycle

- (instancetype)init {
    if ((self = [super init])) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleAppStateResignActive)
                                                     name:UIApplicationWillResignActiveNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleAppStateActive)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
    }
    return self;
}

#pragma mark - App Notification Methods

- (void)handleAppStateResignActive {
    if (self->enabled) {
        [self show];
    }
}
-(void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    UIVisualEffectView *view = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    view.frame = keyWindow.bounds;
    self->obfuscatingView = view;

    [[UIApplication sharedApplication].keyWindow addSubview:self->obfuscatingView];

}


- (void)handleAppStateActive {
    if  (self->obfuscatingView) {
        [UIView animateWithDuration: 0.3
                         animations: ^ {
                             self->obfuscatingView.alpha = 0;
                         }
                         completion: ^(BOOL finished) {
                             [self->obfuscatingView removeFromSuperview];
                             self->obfuscatingView = nil;
                         }
         ];
    }
}

#pragma mark - Public API

RCT_EXPORT_METHOD(enabled:(BOOL) _enable) {
    self->enabled = _enable;
}
RCT_EXPORT_METHOD(_show:(BOOL) _doShow) {
    dispatch_async(dispatch_get_main_queue(), ^{
        if(_doShow) {
            [self show];
        } else {
            [self handleAppStateActive];
        }
    });
}
+ (BOOL)requiresMainQueueSetup {
    return YES;
}

@end
