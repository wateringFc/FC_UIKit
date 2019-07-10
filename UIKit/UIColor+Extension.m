//
//  UIColor+Extension.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UIColor+Extension.h"
#import "NSString+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)fc_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue{
    return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:1];
}

+ (UIColor *)fc_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:alpha];
}

#pragma mark - 创建颜色对象（16进制的RGB值）
+ (UIColor *)fc_colorWithRGB:(uint32_t)rgbValue {
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0f
                           green:((rgbValue & 0xFF00) >> 8) / 255.0f
                            blue:(rgbValue & 0xFF) / 255.0f
                           alpha:1];
}

#pragma mark - 创建颜色对象（16进制的RGB值 + 不透明度值）
+ (UIColor *)fc_colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0f
                           green:((rgbValue & 0xFF00) >> 8) / 255.0f
                            blue:(rgbValue & 0xFF) / 255.0f
                           alpha:alpha];
}

#pragma mark - 创建颜色对象（颜色的16进制字符串值）
// 有效格式：#RRGGBB、#RGB、#RRGGBBAA、#RGBA、0xRGB、RRGGBB ...（"#"和"0x"前缀可以省略不写）
+ (instancetype)fc_colorWithHexString:(NSString *)hexStr {
    CGFloat r, g, b, a;
    if (fc_hexStrToRGBA(hexStr, &r, &g, &b, &a)) {
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }
    return nil;
}

static BOOL fc_hexStrToRGBA(NSString *str, CGFloat *r, CGFloat *g, CGFloat *b, CGFloat *a) {
    str = [[str fc_stringByTrim] uppercaseString];
    if ([str hasPrefix:@"#"]) {
        str = [str substringFromIndex:1];
    } else if ([str hasPrefix:@"0X"]) {
        str = [str substringFromIndex:2];
    }
    
    NSUInteger length = [str length];
    //         RGB            RGBA          RRGGBB        RRGGBBAA
    if (length != 3 && length != 4 && length != 6 && length != 8) {
        return NO;
    }
    
    //RGB, RGBA, RRGGBB, RRGGBBAA
    if (length < 5) {
        *r = fc_hexStrToInt([str substringWithRange:NSMakeRange(0, 1)]) / 255.0f;
        *g = fc_hexStrToInt([str substringWithRange:NSMakeRange(1, 1)]) / 255.0f;
        *b = fc_hexStrToInt([str substringWithRange:NSMakeRange(2, 1)]) / 255.0f;
        if (length == 4)  *a = fc_hexStrToInt([str substringWithRange:NSMakeRange(3, 1)]) / 255.0f;
        else *a = 1;
    } else {
        *r = fc_hexStrToInt([str substringWithRange:NSMakeRange(0, 2)]) / 255.0f;
        *g = fc_hexStrToInt([str substringWithRange:NSMakeRange(2, 2)]) / 255.0f;
        *b = fc_hexStrToInt([str substringWithRange:NSMakeRange(4, 2)]) / 255.0f;
        if (length == 8) *a = fc_hexStrToInt([str substringWithRange:NSMakeRange(6, 2)]) / 255.0f;
        else *a = 1;
    }
    return YES;
}

static inline NSUInteger fc_hexStrToInt(NSString *str) {
    uint32_t result = 0;
    sscanf([str UTF8String], "%X", &result);
    return result;
}

@end
