//
//  UIImage+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Extension)

/** 用颜色返回一张图片 */
+ (nullable UIImage *)fc_imageWithColor:(UIColor *)color;
/** 用颜色返回一张图片（指定图片大小） */
+ (nullable UIImage *)fc_imageWithColor:(UIColor *)color size:(CGSize)size;
/** 为UIImage添加滤镜效果 */
- (nullable UIImage *)fc_addFilter:(NSString *)filter;
/** 设置图片的透明度 */
- (nullable UIImage *)fc_alpha:(CGFloat)alpha;
/**
 *  设置圆角图片
 *
 *  @param radius 圆角半径
 */
- (nullable UIImage *)fc_imageByRoundCornerRadius:(CGFloat)radius;

/**
 *  设置圆角图片
 *
 *  @param radius 圆角半径
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
- (nullable UIImage *)fc_imageByRoundCornerRadius:(CGFloat)radius
                                      borderWidth:(CGFloat)borderWidth
                                      borderColor:(nullable UIColor *)borderColor;

@end

NS_ASSUME_NONNULL_END
