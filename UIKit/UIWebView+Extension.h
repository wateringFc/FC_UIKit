//
//  UIWebView+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (Extension)

/**
 *  移除当前UIWebView的背景阴影
 */
- (void)fc_removeBackgroundShadow;

/**
 *  加载网址
 *
 *  @param website 需要加载的网址
 */
- (void)fc_loadWebsite:(NSString * _Nonnull)website;

@end
