//
//  UILabel+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)
/**
 快速创建

 @param text 内容
 @param font 字体大小
 @param color 颜色
 @param textAlignment 对齐方式
 @return nil
 */
+ (instancetype)fc_labelWithText:(NSString *)text
                       textFont:(UIFont *)font
                      textColor:(UIColor *)color
                  textAlignment:(NSTextAlignment)textAlignment;
/**
 *  设置字间距
 */
- (void)setColumnSpace:(CGFloat)columnSpace;
/**
 *  设置行距
 */
- (void)setRowSpace:(CGFloat)rowSpace;

@end
