//
//  UIButton+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^TouchedBlock)(id sender);

typedef NS_ENUM(NSUInteger, FCButtonEdgeInsetsStyle) {
    /** image在上，label在下 */
    FCButtonEdgeInsetsStyleTop,
    /** image在左，label在右 */
    FCButtonEdgeInsetsStyleLeft,
    /** image在下，label在上 */
    FCButtonEdgeInsetsStyleBottom,
    /** image在右，label在左 */
    FCButtonEdgeInsetsStyleRight
};

@interface UIButton (Extension)

/**
 *  创建带文字
 *
 *  @param name         按钮文字
 *
 *  @return 按钮
 */
+ (UIButton *)fc_buttonWithName:(NSString *)name
                  textLabelFont:(UIFont *)textLabelFont
                      textColor:(UIColor *)textColor;

/**
 *  创建带文字图片按钮
 *
 *  @param name         按钮文字
 *  @param image        普通状态的背景图片
 *  @param hilightImage 高亮状态的背景图片
 *
 *  @return 按钮
 */
+ (UIButton *)fc_buttonWithName:(NSString *)name
                normalBackImage:(NSString *)image
            andHilightBackImage:(NSString *)hilightImage
                  textLabelFont:(UIFont *)textLabelFont
                      textColor:(UIColor *)textColor;

/**
 *  创建只有图片的按钮
 *
 *  @param image        普通状态图片
 *  @param hilightImage 高亮状态图片
 *
 *  @return 按钮
 */
+ (UIButton *)fc_buttonWithNormalImage:(NSString *)image andHilightImage:(NSString *)hilightImage;

/**
 *  添加边框
 *
 *  @param width 宽度
 *  @param color 颜色
 */
- (void)fc_addBorderWidth:(CGFloat)width WithColor:(UIColor *)color;

/**
  给点击状态添加事件

 @param touchHandler block
 */
- (void)fc_addActionHandler:(TouchedBlock)touchHandler;

- (void)fc_addTouchAction:(TouchedBlock)block forControlEvents:(UIControlEvents)controlEvents;


/**
 *  设置button的文字和图片的布局样式，及间距
 *
 *  @param style 文字和图片的布局样式
 *  @param space 文字和图片的间距
 */
- (void)fc_layoutButtonWithEdgeInsetsStyle:(FCButtonEdgeInsetsStyle)style
                           imageTitleSpace:(CGFloat)space;

/**
 倒计时按钮
 
 @param timeout     总时间
 @param waitBlock   倒计时过程中可以再里面做一些操作
 @param finishBlock 完成时执行的block
 */
- (void)fc_startTime:(NSInteger)timeout
           waitBlock:(void(^)(NSInteger remainTime))waitBlock
         finishBlock:(void(^)(void))finishBlock;

/*
 *    倒计时按钮
 *    @param timeLine  倒计时总时间
 *    @param title     还没倒计时的title
 *    @param subTitle  倒计时的子名字 如：时、分
 *    @param mColor    还没倒计时的颜色
 *    @param color     倒计时的颜色
 */

- (void)startWithTime:(NSInteger)timeLine
                title:(NSString *)title
       countDownTitle:(NSString *)subTitle
            mainColor:(UIColor *)mColor
           countColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
