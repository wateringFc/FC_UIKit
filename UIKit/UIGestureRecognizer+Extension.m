//
//  UIGestureRecognizer+Extension.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UIGestureRecognizer+Extension.h"
#import <objc/runtime.h>

static const void *s_fc_gestureKey = "s_fc_gestureKey";
static const void *s_fc_tap_gestureKey = "s_fc_tap_gestureKey";
static const void *s_fc_long_gestureKey = "s_fc_long_gestureKey";

@implementation UIGestureRecognizer (Extension)

- (FCGestureBlock)fc_onGesture {
    return objc_getAssociatedObject(self, s_fc_gestureKey);
}

- (void)setfc_onGesture:(FCGestureBlock)fc_onGesture {
    objc_setAssociatedObject(self,
                             s_fc_gestureKey,
                             fc_onGesture,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(fc_private_onGesture:)];
    
    if (fc_onGesture) {
        [self addTarget:self action:@selector(fc_private_onGesture:)];
    }
}

- (FCTapGestureBlock)fc_onTaped {
    return objc_getAssociatedObject(self, s_fc_tap_gestureKey);
}

- (void)setfc_onTaped:(FCTapGestureBlock)fc_onTaped {
    objc_setAssociatedObject(self,
                             s_fc_tap_gestureKey,
                             fc_onTaped,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(fc_private_onTaped:)];
    
    if (fc_onTaped) {
        [self addTarget:self action:@selector(fc_private_onTaped:)];
    }
}

- (FCLongGestureBlock)fc_onLongPressed {
    return objc_getAssociatedObject(self, s_fc_long_gestureKey);
}

- (void)setfc_onLongPressed:(FCLongGestureBlock)fc_onLongPressed {
    objc_setAssociatedObject(self,
                             s_fc_long_gestureKey,
                             fc_onLongPressed,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self removeTarget:self action:@selector(fc_private_onLongPressed:)];
    
    if (fc_onLongPressed) {
        [self addTarget:self action:@selector(fc_private_onLongPressed:)];
    }
}

#pragma mark - Private
- (void)fc_private_onGesture:(UIGestureRecognizer *)sender {
    FCGestureBlock block = [self fc_onGesture];
    
    if (block) {
        block(sender);
    }
}

- (void)fc_private_onTaped:(UITapGestureRecognizer *)sender {
    FCTapGestureBlock block = [self fc_onTaped];
    
    if (block) {
        block(sender);
    }
}

- (void)fc_private_onLongPressed:(UILongPressGestureRecognizer *)sender {
    FCLongGestureBlock block = [self fc_onLongPressed];
    
    if (block) {
        block(sender);
    }
}

+ (UITapGestureRecognizer *)fc_initWithTarget:(id)target action:(FCTapGestureBlock)action{
    if (!action) return nil ;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [tap setBlock:action] ;
    return tap;
}


- (void)setBlock:(ALActionBlock)actionBlock {
    NSMutableArray *actionBlocksArray = [self actionBlocksArray];
    
    ALActionBlockWrapper *blockActionWrapper = [[ALActionBlockWrapper alloc] init];
    blockActionWrapper.actionBlock = actionBlock;
    [actionBlocksArray addObject:blockActionWrapper];
    
    [self addTarget:blockActionWrapper action:@selector(invokeBlock:)];
}


- (NSMutableArray *)actionBlocksArray {
    NSMutableArray *actionBlocksArray = objc_getAssociatedObject(self, &ALActionBlocksArray);
    if (!actionBlocksArray) {
        actionBlocksArray = [NSMutableArray array];
        objc_setAssociatedObject(self, &ALActionBlocksArray, actionBlocksArray, OBJC_ASSOCIATION_RETAIN);
    }
    return actionBlocksArray;
}


@end
