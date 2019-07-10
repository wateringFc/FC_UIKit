//
//  UIWebView+Extension.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UIWebView+Extension.h"

@implementation UIWebView (Extension)

- (void)fc_removeBackgroundShadow {
    for (UIView *eachSubview in [self.scrollView subviews]) {
        if ([eachSubview isKindOfClass:[UIImageView class]] && eachSubview.frame.origin.x <= 500) {
            eachSubview.hidden = YES;
            [eachSubview removeFromSuperview];
        }
    }
}

- (void)fc_loadWebsite:(NSString * _Nonnull)website {
    [self loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:website]]];
}

@end
