//
//  UIBarButtonItem+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIControl+Extension.h"


@interface UIBarButtonItem (Extension)

/**
 根据图片生成UIBarButtonItem
 
 @param target target对象
 @param action 响应方法
 @param image image
 @return 生成的UIBarButtonItem
 */
+ (UIBarButtonItem *)fc_itemWithTarget:(id)target
                                action:(SEL)action
                                 image:(NSString *)image;
/**
 根据图片生成UIBarButtonItem
 
 @param target target对象
 @param action 响应方法
 @param image image
 @param imageEdgeInsets 图片偏移
 @return 生成的UIBarButtonItem
 */
+ (UIBarButtonItem *)fc_itemWithTarget:(id)target
                                action:(SEL)action
                                 image:(NSString *)image
                       imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets;

/**
 根据图片生成UIBarButtonItem
 
 @param target target对象
 @param action 响应方法
 @param nomalImage nomalImage
 @param higeLightedImage higeLightedImage
 @param imageEdgeInsets 图片偏移
 @return 生成的UIBarButtonItem
 */
+ (UIBarButtonItem *)fc_itemWithTarget:(id)target
                                action:(SEL)action
                            nomalImage:(NSString *)nomalImage
                      higeLightedImage:(NSString *)higeLightedImage
                       imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets;


/**
 根据文字生成UIBarButtonItem
 
 @param target target对象
 @param action 响应方法
 @param title title
 */
+ (UIBarButtonItem *)fc_itemWithTarget:(id)target
                                action:(SEL)action
                                 title:(NSString *)title;

/**
 根据文字生成UIBarButtonItem
 
 @param target target对象
 @param action 响应方法
 @param title title
 @param titleEdgeInsets 文字偏移
 @return 生成的UIBarButtonItem
 */
+ (UIBarButtonItem *)fc_itemWithTarget:(id)target
                                action:(SEL)action
                                 title:(NSString *)title
                       titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets;

/**
 根据文字生成UIBarButtonItem
 
 @param target target对象
 @param action 响应方法
 @param title title
 @param font font
 @param titleColor 字体颜色
 @param highlightedColor 高亮颜色
 @param titleEdgeInsets 文字偏移
 @return 生成的UIBarButtonItem
 */
+ (UIBarButtonItem *)fc_itemWithTarget:(id)target
                                action:(SEL)action
                                 title:(NSString *)title
                                  font:(UIFont *)font
                            titleColor:(UIColor *)titleColor
                      highlightedColor:(UIColor *)highlightedColor
                       titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets;


/**
 用作修正位置的UIBarButtonItem
 
 @param width 修正宽度
 @return 修正位置的UIBarButtonItem
 */
+ (UIBarButtonItem *)fc_fixedSpaceWithWidth:(CGFloat)width;

@end
