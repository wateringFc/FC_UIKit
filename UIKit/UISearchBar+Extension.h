//
//  UISearchBar+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UISearchBar (Extension)

+ (UISearchBar *)fc_initWithPlaceHolder:(NSString *)placeholder
                     backgroundColor:(UIColor *)backgroundColor
                            barStyle:(UIBarStyle)barStyle
                      searchBarStyle:(UISearchBarStyle)searchBarStyle
                         borderColor:(UIColor *)borderColor
                         borderWidth:(CGFloat)borderWidth;

/**
 设置背景颜色
 
 @param color searchBar背景颜色
 */
- (void)fc_setBackgroupColor:(UIColor *)color;

/**
 设置光标的颜色
 
 @param color 光标颜色
 */
- (void)fc_setTextFieldCursorColor:(UIColor *)color;

/**
 设置文本域背景的颜色
 
 @param color  文本域的背景颜色
 */
- (void)fc_setTextFieldBackGroudColor:(UIColor *)color;

/**
 设置文本域的圆角
 
 @param cornerRadius 圆角
 */
- (void)fc_setTextFieldCornerRadius:(CGFloat)cornerRadius;

/**
 修改占位符的字体颜色
 
 @param color 占位符的字体颜色
 */
- (void)fc_setTextFieldPlaceHolderColor:(UIColor *)color;

/**
 设置占位符的字体大小
 
 @param font 占位符的字体大小
 */
- (void)fc_setPlaceHolderFont:(UIFont *)font;

/**
 设置搜索中的字体
 
 //需要在searchBar: textDidChange:回调中使用
 
 @param font 设置的字体
 */
- (void)fc_setSearchFont:(UIFont *)font;

/**
 用于解决iOS11下 高度小于36 圆角剪切的问题
 
 @param size 新的大小，默认值操作height
 */
- (void)fc_setSearchFieldBackgroundChangedSize:(CGSize)size NS_AVAILABLE_IOS(11.0);

@end

NS_ASSUME_NONNULL_END
