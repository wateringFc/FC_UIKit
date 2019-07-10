//
//  UINavigationBar+FC.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UINavigationBar+FC.h"
#import <objc/runtime.h>

static char fc_overlayKey;

@implementation UINavigationBar (FC)

- (UIView *)fc_overlay
{
    return objc_getAssociatedObject(self, &fc_overlayKey);
}

- (void)setfc_overlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &fc_overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)fc_setBackgroundColor:(UIColor *)backgroundColor
{
    if (!self.fc_overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.fc_overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
        self.fc_overlay.userInteractionEnabled = NO;
        self.fc_overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.fc_overlay atIndex:0];
    }
    self.fc_overlay.backgroundColor = backgroundColor;
}

- (void)fc_setTranslationY:(CGFloat)translationY
{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (void)fc_setElementsAlpha:(CGFloat)alpha
{
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
    //    when viewController first load, the titleView maybe nil
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
}

- (void)fc_reset
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.fc_overlay removeFromSuperview];
    self.fc_overlay = nil;
}

@end
