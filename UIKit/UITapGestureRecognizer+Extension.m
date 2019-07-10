//
//  UITapGestureRecognizer+Extension.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UITapGestureRecognizer+Extension.h"
#import <objc/runtime.h>

static char kActionHandlerTapBlockKey;
static char kActionHandlerTapGestureKey;

@implementation UITapGestureRecognizer (Extension)

+ (UITapGestureRecognizer *)fc_addTapActionWithBlock:(TapActionBlock)block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kActionHandlerTapGestureKey);
    if (!gesture){
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleActionForTapGesture:)];
        objc_setAssociatedObject(self, &kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
    return gesture;
}

- (void)handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized){
        TapActionBlock block = objc_getAssociatedObject(self, &kActionHandlerTapBlockKey);
        if (block){
            block(gesture);
        }
    }
}


@end
