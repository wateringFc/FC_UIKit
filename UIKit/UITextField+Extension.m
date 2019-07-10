//
//  UITextField+Extension.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UITextField+Extension.h"
#import <objc/runtime.h>

static NSString *kLimitTextLengthKey = @"kLimitTextLengthKey";

@implementation UITextField (Extension)

+ (UITextField *)fc_textFieldWithPlaceholder:(NSString *)placeholder
                                   textColor:(UIColor *)textColor
                                        font:(UIFont *)font
                                textAlignment:(NSTextAlignment)textAlignment
                             secureTextEntry:(BOOL)secureTextEntry
                                    delegate:(id)delegate
{
    UITextField *t    = [[UITextField alloc] init];
    t.placeholder     = placeholder;
    t.textColor       = textColor;
    t.font            = font;
    t.textAlignment   = textAlignment;
    t.secureTextEntry = secureTextEntry;
    t.delegate        = delegate;
    return t;
}

/**
 *  设置UITextField左边距
 *
 *  @param leftWidth 边距
 */
- (void)fc_setTextFieldLeftPadding:(CGFloat)leftWidth
{
    CGRect frame = self.frame;
    frame.size.width = leftWidth;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftview;
    
}

/**
 设置UITextField 右侧清除按钮图片
 
 @param normalButtonName      常规图片名
 @param highlightedButtonName 高亮图片名
 */
- (void)fc_setTextFieldClearButtonNormal:(NSString *)normalButtonName Highlighted:(NSString *)highlightedButtonName
{
    UIButton *clearButton = [self valueForKey:@"_clearButton"];
    [clearButton setImage:[UIImage imageNamed:normalButtonName] forState:UIControlStateNormal];
    [clearButton setImage:[UIImage imageNamed:highlightedButtonName] forState:UIControlStateHighlighted];
    self.clearButtonMode = UITextFieldViewModeAlways;
    
}

/**
 *  设置UITextField Placeholder颜色
 *
 *  @param color 颜色值
 */
- (void)fc_setTextFieldPlaceholderColor:(UIColor *)color
{
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
    
}

/**
 *  设置全局共用UITextField对象的指定格式
 */
+ (void)fc_setTextFieldSpecifiedformat
{
    //设置全局共用UITextField对象的指定格式（在实际开发中自定义）
    [[self alloc] fc_setTextFieldLeftPadding:10];
    
    // TODO:需要设置具体的图片
    [[self alloc] fc_setTextFieldClearButtonNormal:@"" Highlighted:@""];
    
    [[self alloc] fc_setTextFieldPlaceholderColor:[UIColor grayColor]];
    
}


- (void)fc_limitTextLength:(int)length
{
    objc_setAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey), [NSNumber numberWithInt:length], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addTarget:self action:@selector(textFieldTextLengthLimit:) forControlEvents:UIControlEventEditingChanged];
    
}

- (void)textFieldTextLengthLimit:(id)sender
{
    NSNumber *lengthNumber = objc_getAssociatedObject(self, (__bridge const void *)(kLimitTextLengthKey));
    int length = [lengthNumber intValue];
    //下面是修改部分
    bool isChinese;//判断当前输入法是否是中文
    NSArray *currentar = [UITextInputMode activeInputModes];
    UITextInputMode *current = [currentar firstObject];
    if ([current.primaryLanguage isEqualToString: @"en-US"]) {
        isChinese = false;
    }
    else {
        isChinese = true;
    }
    
    if(sender == self) {
        // length是自己设置的位数
        NSString *str = [[self text] stringByReplacingOccurrencesOfString:@"?" withString:@""];
        if (isChinese) { //中文输入法下
            UITextRange *selectedRange = [self markedTextRange];
            //获取高亮部分
            UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position)
            {
                if ( str.length>=length) {
                    NSString *strNew = [NSString stringWithString:str];
                    [self setText:[strNew substringToIndex:length]];
                }
            }
        }
        else
        {
            if ([str length]>=length) {
                NSString *strNew = [NSString stringWithString:str];
                [self setText:[strNew substringToIndex:length]];
            }
        }
    }
}

//add by xjw，中英文的总字符数，暂时不用，判断太多，容易崩溃
- (int)convertToInt:(NSString*)strTemp
{
    int strlength = 0;
    char* p = (char*)[strTemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strTemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
        
    }
    return strlength;
}

- (NSUInteger)getToInt:(NSString*)strTemp
{
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* da = [strTemp dataUsingEncoding:enc];
    return [da length];
}

@end
