//
//  UIView+Extention.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define vAlertTag 10086

#define CustomViewTranslate(ViewClass, view) (ViewClass*) view;

typedef enum {
    
    //上
    UIViewBorderDirectTop = 0,
    
    //左
    UIViewBorderDirectLeft,
    
    //下
    UIViewBorderDirectBottom,
    
    //右
    UIViewBorderDirectRight,
    
} UIViewBorderDirect;

@interface UIView (Extention)

/** 返回视图的视图控制器(可能为nil) */
@property (nullable, nonatomic, readonly) UIViewController *viewController;
/** left: frame.origin.x */
@property (nonatomic) CGFloat left;
/** top: frame.origin.y */
@property (nonatomic) CGFloat top;
/** right: frame.origin.x + frame.size.width */
@property (nonatomic) CGFloat right;
/** bottom: frame.origin.y + frame.size.height */
@property (nonatomic) CGFloat bottom;
/** width: frame.size.width */
@property (nonatomic) CGFloat width;
/** height: frame.size.height */
@property (nonatomic) CGFloat height;
/** centerX: center.x */
@property (nonatomic) CGFloat centerX;
/** centerY: center.y */
@property (nonatomic) CGFloat centerY;
/** origin: frame.origin */
@property (nonatomic) CGPoint origin;
/** size: frame.size */
@property (nonatomic) CGSize  size;

/**
 *  设置视图view的部分圆角(绝对布局)
 *
 *  @param corners  需要设置为圆角的角(枚举类型)
 *  @param radius   需要设置的圆角大小
 */
- (void)fc_setRoundedCorners:(UIRectCorner)corners
                  withRadius:(CGSize)radius;

/**
 *  设置视图view的部分圆角(相对布局)
 *
 *  @param corners  需要设置为圆角的角(枚举类型)
 *  @param radius   需要设置的圆角大小
 *  @param rect     需要设置的圆角view的rect
 */
- (void)fc_setRoundedCorners:(UIRectCorner)corners
                  withRadius:(CGSize)radius
                    viewRect:(CGRect)rect;

/**
 *  设置视图view的阴影
 *
 *  @param color  阴影颜色
 *  @param offset 阴影偏移量
 *  @param radius 阴影半径
 */
- (void)fc_setLayerShadow:(nullable UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

/** 删除所有子视图 */
- (void)fc_removeAllSubviews;

/** 创建屏幕快照 */
- (nullable UIImage *)fc_snapshotImage;

/** 创建屏幕快照pdf */
- (nullable NSData *)fc_snapshotPDF;

/**
 *  添加边框：注给scrollView添加会出错
 *
 *  @param direct 方向
 *  @param color  颜色
 *  @param width  线宽
 */
- (void)fc_addSingleBorder:(UIViewBorderDirect)direct color:(UIColor*)color width:(CGFloat)width;

/**
 *  自动从xib创建视图
 */
+ (instancetype)viewFromXIB;

/**
 *  添加一组子view：
 */
- (void)fc_addSubviewsWithArray:(NSArray*)subViews;

/**
 *  添加边框:四边
 */
- (void)fc_setBorder:(UIColor*)color width:(CGFloat)width;

/**
 *  调试
 */
- (void)fc_debug:(UIColor*)color width:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
