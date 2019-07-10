//
//  UIControl+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ALActionBlock)(id weakSender);
static NSString *const ALActionBlocksArray = @"ALActionBlocksArray";

@interface ALActionBlockWrapper : NSObject

@property (nonatomic, copy) ALActionBlock actionBlock;
@property (nonatomic, assign) UIControlEvents controlEvents;

- (void)invokeBlock:(id)sender;

@end

@interface UIControl (Extension)

- (void)fc_handleControlEvents:(UIControlEvents)controlEvents withBlock:(ALActionBlock)actionBlock;
- (void)fc_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents;

@end
