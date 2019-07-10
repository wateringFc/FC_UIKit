//
//  UIButton+Extension.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UIButton+Extension.h"
#import <objc/runtime.h>

static const void *UIButtonBlockKey = &UIButtonBlockKey;

@implementation UIButton (Extension)

#pragma mark 创建按钮

+ (UIButton *)fc_buttonWithName:(NSString *)name
                  textLabelFont:(UIFont *)textLabelFont
                      textColor:(UIColor *)textColor{
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:name forState:UIControlStateNormal];
    [btn setTitle:name forState:UIControlStateHighlighted];
    btn.titleLabel.font = textLabelFont;
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    return btn;
}

+ (UIButton *)fc_buttonWithName:(NSString *)name
                normalBackImage:(NSString *)image
            andHilightBackImage:(NSString *)hilightImage
                  textLabelFont:(UIFont *)textLabelFont
                      textColor:(UIColor *)textColor
{
    UIImage *normalImage = [UIImage imageNamed:image];
    UIImage *hightlightImage = [UIImage imageNamed:hilightImage];
    normalImage = [normalImage stretchableImageWithLeftCapWidth:55 topCapHeight:17];
    hightlightImage = [hightlightImage stretchableImageWithLeftCapWidth:55 topCapHeight:17];
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:name forState:UIControlStateNormal];
    [btn setTitle:name forState:UIControlStateHighlighted];
    btn.titleLabel.font = textLabelFont;
    btn.titleLabel.textColor = textColor;
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn setBackgroundImage:hightlightImage forState:UIControlStateHighlighted];
    return btn;
}

+ (UIButton*)fc_buttonWithNormalImage:(NSString*)image andHilightImage:(NSString*)hilightImage
{
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:hilightImage] forState:UIControlStateHighlighted];
    return btn;
}

- (void)fc_addBorderWidth:(CGFloat)width WithColor:(UIColor *)color
{
    self.layer.cornerRadius = 4.0;
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

- (void)fc_addActionHandler:(TouchedBlock)touchHandler{
    objc_setAssociatedObject(self, UIButtonBlockKey, touchHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(fc_actionTouched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)fc_addTouchAction:(TouchedBlock)block forControlEvents:(UIControlEvents)controlEvents
{
    objc_setAssociatedObject(self, UIButtonBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(fc_actionTouched:) forControlEvents:controlEvents];
}

- (void)fc_actionTouched:(UIButton *)btn{
    TouchedBlock block = objc_getAssociatedObject(self, UIButtonBlockKey);
    if (block) {
        block(btn);
    }
}

- (void)fc_layoutButtonWithEdgeInsetsStyle:(FCButtonEdgeInsetsStyle)style
                           imageTitleSpace:(CGFloat)space {
    /**
     *  前置知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case FCButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - space / 2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight - space / 2.0, 0);
        }
            break;
        case FCButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space / 2.0, 0, space / 2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space / 2.0, 0, -space / 2.0);
        }
            break;
        case FCButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight - space / 2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight - space / 2.0, -imageWith, 0, 0);
        }
            break;
        case FCButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + space / 2.0, 0, -labelWidth - space / 2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith - space / 2.0, 0, imageWith + space / 2.0);
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

- (void)fc_startTime:(NSInteger)timeout waitBlock:(void(^)(NSInteger remainTime))waitBlock finishBlock:(void(^)(void))finishBlock;{
    __block NSInteger timeOut = timeout;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeOut <= 0)
        { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                if (finishBlock)
                {
                    finishBlock();
                }
                self.userInteractionEnabled = YES;
            });
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (waitBlock)
                {
                    waitBlock(timeOut);
                }
                self.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color
{
    
    // 倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        // 倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.backgroundColor = mColor;
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = timeOut % 60;
            NSString * timeStr = [NSString stringWithFormat:@"%0.2d",seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = color;
                [self setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            
            timeOut--;
        }
    });
    
    dispatch_resume(_timer);
}

@end
