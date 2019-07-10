//
//  UITextField+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)

/**
 快速创建

 @param placeholder 占位符
 @param textColor 输入字体颜色
 @param font 字体大小
 @param textAlignment 对齐方式
 @param secureTextEntry 是否要隐藏
 @param delegate 代理
 @return nil
 */
+ (UITextField *)fc_textFieldWithPlaceholder:(NSString *)placeholder
                                   textColor:(UIColor *)textColor
                                        font:(UIFont *)font
                               textAlignment:(NSTextAlignment)textAlignment
                             secureTextEntry:(BOOL)secureTextEntry
                                    delegate:(id)delegate;

/**
 限制输入长度
 
 @param length 长度
 */
- (void)fc_limitTextLength:(int)length;


/**
 *  设置UITextField左边距
 *
 *  @param leftWidth 边距
 */
- (void)fc_setTextFieldLeftPadding:(CGFloat)leftWidth;


/**
 设置UITextField 右侧清除按钮图片
 
 @param normalButtonName      常规图片名
 @param highlightedButtonName 高亮图片名
 */
- (void)fc_setTextFieldClearButtonNormal:(NSString *)normalButtonName Highlighted:(NSString *)highlightedButtonName;


/**
 *  设置UITextField Placeholder颜色
 *
 *  @param color 颜色值
 */
- (void)fc_setTextFieldPlaceholderColor:(UIColor *)color;

/**
 *  设置全局共用UITextField对象的指定格式
 *
 *  注意：此是对setTextFieldClearButtonNormal:Highlighted:方法的再封装，需要到.m文件中去自己设置图片
 *
 */
+ (void)fc_setTextFieldSpecifiedformat;

@end
