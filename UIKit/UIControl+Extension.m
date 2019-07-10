//
//  UIControl+Extension.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UIControl+Extension.h"
#import <objc/runtime.h>

@implementation ALActionBlockWrapper

- (void)invokeBlock:(id)sender {
    if (self.actionBlock) {
        self.actionBlock(sender);
    }
}
@end

@implementation UIControl (Extension)

- (void)fc_handleControlEvents:(UIControlEvents)controlEvents withBlock:(ALActionBlock)actionBlock {
    NSMutableArray *actionBlocksArray = [self actionBlocksArray];
    
    ALActionBlockWrapper *blockActionWrapper = [[ALActionBlockWrapper alloc] init];
    blockActionWrapper.actionBlock = actionBlock;
    blockActionWrapper.controlEvents = controlEvents;
    [actionBlocksArray addObject:blockActionWrapper];
    
    [self addTarget:blockActionWrapper action:@selector(invokeBlock:) forControlEvents:controlEvents];
}


- (void)fc_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents {
    NSMutableArray *actionBlocksArray = [self actionBlocksArray];
    NSMutableArray *wrappersToRemove = [NSMutableArray arrayWithCapacity:[actionBlocksArray count]];
    
    [actionBlocksArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        ALActionBlockWrapper *wrapperTmp = obj;
        if (wrapperTmp.controlEvents == controlEvents) {
            [wrappersToRemove addObject:wrapperTmp];
            [self removeTarget:wrapperTmp action:@selector(invokeBlock:) forControlEvents:controlEvents];
        }
    }];
    
    [actionBlocksArray removeObjectsInArray:wrappersToRemove];
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
