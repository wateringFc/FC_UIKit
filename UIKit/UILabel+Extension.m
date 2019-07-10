//
//  UILabel+Extension.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UILabel+Extension.h"
#import <CoreText/CoreText.h>

@implementation UILabel (Extension)

+ (instancetype)fc_labelWithText:(NSString *)text
                        textFont:(UIFont *)font
                       textColor:(UIColor *)color
                   textAlignment:(NSTextAlignment)textAlignment{
    
    UILabel *label      = [[UILabel alloc] init];
    label.text          = text;
    label.font          = font;
    label.textColor     = color;
    label.textAlignment = textAlignment;
    return                label;
}

- (void)setColumnSpace:(CGFloat)columnSpace
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //调整间距
    [attributedString addAttribute:(__bridge NSString *)kCTKernAttributeName value:@(columnSpace) range:NSMakeRange(0, [attributedString length])];
    self.attributedText = attributedString;
}

- (void)setRowSpace:(CGFloat)rowSpace
{
    self.numberOfLines = 0;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //调整行距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = rowSpace;
    paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
}

@end
