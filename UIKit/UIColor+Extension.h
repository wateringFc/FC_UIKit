//
//  UIColor+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#ifndef UIColorHex
#define UIColorHex(_hex_) [UIColor br_colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
#endif

@interface UIColor (Extension)

/**
 *  创建颜色对象
 *
 *  @param rgbValue  16进制的RGB值（如：0x66ccff）
 *
 *  @return 颜色对象
 */
+ (UIColor *)fc_colorWithRGB:(uint32_t)rgbValue;

/**
 *  创建颜色对象
 *
 *  @param rgbValue  16进制的RGB值（如：0x66ccff）
 *  @param alpha     不透明度值（值范围：0.0 ~ 1.0）
 *
 *  @return 颜色对象
 */
+ (UIColor *)fc_colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;

/**
 *  创建颜色对象
 *
 *  @param hexStr  颜色的16进制字符串值（格式如：@"#66ccff", @"#6cf", @"#66ccff88", @"#6cf8", @"0x66ccff", @"66ccff"...）
 *
 *  @return 颜色对象
 */
+ (nullable UIColor *)fc_colorWithHexString:(NSString *)hexStr;

/**
 快速创建颜色

 @param red 红
 @param green 绿
 @param blue 蓝
 @return UIColor
 */
+ (UIColor *)fc_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;


/**
 快速创建颜色
 
 @param red 红
 @param green 绿
 @param blue 蓝
 @param alpha 透明度
 @return UIColor
 */
+ (UIColor *)fc_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
