//
//  UIView+Extention.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UIView+Extention.h"

@implementation UIView (Extention)

/// frame 快捷访问
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#pragma mark - 设置视图view的部分圆角(绝对布局)
// corners(枚举类型，可组合使用)：UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
- (void)fc_setRoundedCorners:(UIRectCorner)corners
                  withRadius:(CGSize)radius {
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:radius];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
}

#pragma mark - 设置视图view的部分圆角(相对布局)
// corners(枚举类型，可组合使用)：UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
- (void)fc_setRoundedCorners:(UIRectCorner)corners
                  withRadius:(CGSize)radius
                    viewRect:(CGRect)rect {
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radius];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    self.layer.mask = shape;
}

#pragma mark - 设置视图view的阴影
- (void)fc_setLayerShadow:(nullable UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = 1;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

#pragma mark - 删除所有子视图
- (void)fc_removeAllSubviews {
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

#pragma mark - 返回视图的视图控制器
- (UIViewController *)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma mark - 创建屏幕快照
- (UIImage *)fc_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

#pragma mark - 创建屏幕快照pdf
- (NSData *)fc_snapshotPDF {
    CGRect bounds = self.bounds;
    NSMutableData* data = [NSMutableData data];
    CGDataConsumerRef consumer = CGDataConsumerCreateWithCFData((__bridge CFMutableDataRef)data);
    CGContextRef context = CGPDFContextCreate(consumer, &bounds, NULL);
    CGDataConsumerRelease(consumer);
    if (!context) return nil;
    CGPDFContextBeginPage(context, NULL);
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    [self.layer renderInContext:context];
    CGPDFContextEndPage(context);
    CGPDFContextClose(context);
    CGContextRelease(context);
    return data;
}

/**
*  添加边框：注给scrollView添加会出错
*
*  @param direct 方向
*  @param color  颜色
*  @param width  线宽
*/
- (void)fc_addSingleBorder:(UIViewBorderDirect)direct color:(UIColor*)color width:(CGFloat)width
{
    
    UIView* line = [[UIView alloc] init];
    
    //设置颜色
    line.backgroundColor = color;
    
    //添加
    [self addSubview:line];
    
    //禁用ar
    line.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary* views = NSDictionaryOfVariableBindings(line);
    NSDictionary* metrics = @{ @"w" : @(width),
                               @"y" : @(self.height - width),
                               @"x" : @(self.width - width) };
    
    NSString* vfl_H = @"";
    NSString* vfl_W = @"";
    
    //上
    if (UIViewBorderDirectTop == direct) {
        vfl_H = @"H:|-0-[line]-0-|";
        vfl_W = @"V:|-0-[line(==w)]";
    }
    
    //左
    if (UIViewBorderDirectLeft == direct) {
        vfl_H = @"H:|-0-[line(==w)]";
        vfl_W = @"V:|-0-[line]-0-|";
    }
    
    //下
    if (UIViewBorderDirectBottom == direct) {
        vfl_H = @"H:|-0-[line]-0-|";
        vfl_W = @"V:[line(==w)]-0-|";
    }
    
    //右
    if (UIViewBorderDirectRight == direct) {
        vfl_H = @"H:[line(==w)]-0-|";
        vfl_W = @"V:|-0-[line]-0-|";
    }
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl_H options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl_W options:0 metrics:metrics views:views]];
}

/**
 *  自动从xib创建视图
 */
+ (instancetype)viewFromXIB
{
    
    NSString* name = NSStringFromClass(self);
    
    UIView* xibView = [[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] firstObject];
    
    if (xibView == nil) {
        NSLog(@"CoreXibView：从xib创建视图失败，当前类是：%@", name);
    }
    
    return xibView;
}


#pragma mark 添加一组子view：
- (void)fc_addSubviewsWithArray:(NSArray*)subViews
{
    
    for (UIView* view in subViews) {
        
        [self addSubview:view];
    }
}

#pragma mark 圆角处理
- (void)setRadius:(CGFloat)r
{
    
    if (r <= 0)
        r = self.bounds.size.width * .5f;
    
    //圆角半径
    self.layer.cornerRadius = r;
    
    //强制
    self.layer.masksToBounds = YES;
}

- (CGFloat)radius
{
    return 0;
}

/**
 *  添加底部的边线
 */
- (void)fc_setBottomBorderColor:(UIColor*)bottomBorderColor
{
    
}

- (UIColor *)fc_bottomBorderColor
{
    return nil;
}

/**
 *  添加边框
 */
- (void)fc_setBorder:(UIColor*)color width:(CGFloat)width
{
    CALayer* layer = self.layer;
    layer.borderColor = color.CGColor;
    layer.borderWidth = width;
}

/**
 *  调试
 */
- (void)fc_debug:(UIColor*)color width:(CGFloat)width
{
    
    [self fc_setBorder:color width:width];
}



@end
