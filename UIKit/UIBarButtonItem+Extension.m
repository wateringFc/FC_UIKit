//
//  UIBarButtonItem+Extension.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)fc_itemWithTarget:(id)target action:(SEL)action image:(NSString *)image {
    return [self fc_itemWithTarget:target action:action nomalImage:image higeLightedImage:nil imageEdgeInsets:UIEdgeInsetsZero];
}

+ (UIBarButtonItem *)fc_itemWithTarget:(id)target action:(SEL)action image:(NSString *)image imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    return [self fc_itemWithTarget:target action:action nomalImage:image higeLightedImage:nil imageEdgeInsets:imageEdgeInsets];
}

+ (UIBarButtonItem *)fc_itemWithTarget:(id)target
                            action:(SEL)action
                        nomalImage:(NSString *)nomalImage
                  higeLightedImage:(NSString *)higeLightedImage
                   imageEdgeInsets:(UIEdgeInsets)imageEdgeInsets {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [button setImage:[[UIImage imageNamed:nomalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    if (higeLightedImage) {
        [button setImage:[UIImage imageNamed:higeLightedImage] forState:UIControlStateHighlighted];
    }
    [button sizeToFit];
    if (button.bounds.size.width < 40) {
        CGFloat width = 40 / button.bounds.size.height * button.bounds.size.width;
        button.bounds = CGRectMake(0, 0, width, 40);
    }
    button.imageEdgeInsets = imageEdgeInsets;
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)fc_itemWithTarget:(id)target action:(SEL)action title:(NSString *)title {
    return [self fc_itemWithTarget:target action:action title:title font:[UIFont systemFontOfSize:12.0] titleColor:UIColor.whiteColor highlightedColor:nil titleEdgeInsets:UIEdgeInsetsZero];
}

+ (UIBarButtonItem *)fc_itemWithTarget:(id)target action:(SEL)action title:(NSString *)title titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets {
    return [self fc_itemWithTarget:target action:action title:title font:nil titleColor:nil highlightedColor:nil titleEdgeInsets:titleEdgeInsets];
}

+ (UIBarButtonItem *)fc_itemWithTarget:(id)target
                            action:(SEL)action
                             title:(NSString *)title
                              font:(UIFont *)font
                        titleColor:(UIColor *)titleColor
                  highlightedColor:(UIColor *)highlightedColor
                   titleEdgeInsets:(UIEdgeInsets)titleEdgeInsets {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = font?font:nil;
    [button setTitleColor:titleColor?titleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:highlightedColor?highlightedColor:nil forState:UIControlStateHighlighted];
    
    [button sizeToFit];
    if (button.bounds.size.width < 40) {
        CGFloat width = 40 / button.bounds.size.height * button.bounds.size.width;
        button.bounds = CGRectMake(0, 0, width, 40);
    }
    button.titleEdgeInsets = titleEdgeInsets;
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)fc_fixedSpaceWithWidth:(CGFloat)width {
    
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpace.width = width;
    return fixedSpace;
}

@end
