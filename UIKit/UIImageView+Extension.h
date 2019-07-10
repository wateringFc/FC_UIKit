//
//  UIImageView+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Extension)
/**
 快速创建

 @param imageName 图片名称
 @return nil
 */
+ (UIImageView *)fc_initWithImageName:(NSString *)imageName;

/** 使用 CAShapeLayer 和 UIBezierPath 设置圆角 */
- (void)fc_setBezierPathCornerRadius:(CGFloat)radius;

/** 通过 Graphics 和 BezierPath 设置圆角（推荐用这个）*/
- (void)fc_setGraphicsCornerRadius:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
