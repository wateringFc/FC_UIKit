//
//  UINavigationBar+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Extension)

/**
 *  设置UINavigationBar是否透明
 *
 *  @param transparent YES透明，NO不透明
 */
- (void)fc_setTransparent:(BOOL)transparent;

/**
 *  设置UINavigationBar是否透明、半透明
 *
 *  @param transparent YES透明，NO不透明
 *  @param translucent 一个决定UINavigationBar是否半透明的Boolean值参数
 */
- (void)fc_setTransparent:(BOOL)transparent translucent:(BOOL)translucent;

@end
