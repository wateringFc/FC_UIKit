//
//  UITapGestureRecognizer+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapActionBlock)(UITapGestureRecognizer *gestureRecoginzer);

@interface UITapGestureRecognizer (Extension)

+ (UITapGestureRecognizer *)fc_addTapActionWithBlock:(TapActionBlock)block;

@end
