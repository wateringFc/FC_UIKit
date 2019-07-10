//
//  UIView+LineSpace.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UIView+LineSpace.h"

@implementation UIView (LineSpace)

/**
 *  添加上分割线
 */
-(void)addTopLineWithHeight:(CGFloat)height{
    UIView*line = [[UIView alloc]init];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self).mas_offset(0);
        make.height.mas_equalTo(height);
    }];
    line.backgroundColor = RGBCOLOR(228, 228, 228);
}
/**
 *  添加下分割线
 */
-(void)addBottomLineWithHeight:(CGFloat)height{
    UIView*line = [[UIView alloc]init];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(self).mas_offset(0);
        make.height.mas_equalTo(height);
    }];
    line.backgroundColor = RGBCOLOR(228, 228, 228);;
}

@end
