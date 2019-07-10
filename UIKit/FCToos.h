//
//  Toos.h
//  dddd
//
//  Created by watering on 2019/7/10.
//  Copyright © 2019年 watering. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Toos : NSObject
/**
 计算文本【宽度】
 
 @param text 计算文本
 @param textFont 文本字体大小
 @param textHeight 文本显示的固定高度
 @return 返回计算之后文本的宽度
 */
+ (CGFloat)returnTextWidthWithText:(NSString *)text Font:(UIFont *)textFont defaultHeight:(CGFloat)textHeight;


/**
 计算文本【高度】
 
 @param text 计算文本
 @param textFont 文本字体大小
 @param textWidth 文本显示的固定宽度
 @return 返回计算之后文本的高度
 */
+ (CGFloat)returenTextHeightWihtText:(NSString *)text Font:(UIFont *)textFont defaultWidth:(CGFloat)textWidth;


/** 通用创建labe */
+ (UILabel *)createLabelWithFrame:(CGRect)lFrame Font:(UIFont *)lFont TextColor:(UIColor *)fColor TextAlignment:(NSTextAlignment)fAlignent Text:(NSString *)lText;


/** 通用创建imageview */
+ (UIImageView *)createImageViewWithFrame:(CGRect)iFrame Image:(UIImage *)img BackgroundColor:(UIColor *)bColor;


/** 获取有行间距的albel的高度 */
+ (CGFloat)returnSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width withLineSpace:(float)lineSpace;

/**
 时间 转 时间戳
 
 @param date 时间
 @return 时间戳
 */
+ (NSInteger)returnTimeSp:(NSDate *)date;

/**
 时间戳 转 时间字符串（yyyy-MM-dd）
 
 @param time 时间戳
 @return 时间字符串
 */
+ (NSString *)returnDateTime:(NSString *)time;

/**
 时间 转 时间字符串（yyyy-MM-dd）
 
 @param date 时间
 @return 时间字符串
 */
+ (NSString *)returnDateToString:(NSDate *)date;

/**
 时间字符串 转 时间
 
 @param string 时间字符串
 @param type 字符串形式
 @return 时间
 */
+ (NSDate *)returnStringTurnDate:(NSString *)string typeStr:(NSString *)type;


/**
 两个时间比较大小【1:一 比 二 大】  【-1: 一 比 二 小】 【0:时间相等】
 
 @param oneDay 第一个时间
 @param anotherDay 第二个时间
 @return 【1:一 比 二 大】  【-1: 一 比 二 小】 【0:时间相等】
 */
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;


/**
 计算两个时间的间隔天数
 
 @param fromDate 开始时间
 @param toDate 结束时间
 @return 间隔天数
 */
+ (int)numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;


/**
 获取当前时间
 
 @param isText YES：yyyy年MM月dd日 NO：yyyy-MM-dd
 @return 返回当前时间字符串
 */
+ (NSString *)returnCurrentDateStrShowType:(BOOL)isText;


/**
 计算当前日期为周几
 
 @param inputDate 输入日期
 @return 周几
 */
+ (NSString*)returnWeekdayStringFromDate:(NSDate*)inputDate;


/**
 返回两个时间的间隔 年 月 日 (日期输入格式为 xxxx-xx-xx)
 
 @param unit 比较的依据(年月日时分秒)
 @param startDateStr 开始时间
 @param andDateStr 结束时间
 @return 日期组件
 */
+ (NSDateComponents *)returnDateIntervalComparisonType:(NSCalendarUnit)unit StartDate:(NSString *)startDateStr andDate:(NSString *)andDateStr;

/**
 根据单个字符分割
 
 @param string 原始字符串
 @param character 单个字符
 @return 分割后的数组
 */
+ (NSArray *)componentsSeparatedString:(NSString *)string character:(NSString *)character;


/**
 根据多个字符分割
 
 @param string 原始字符串
 @param character 多个字符串（如：@"年 月 日"）
 @return 分割后的数组
 */
+ (NSArray *)componentsSeparatedStringMultipleCharacter:(NSString *)string character:(NSString *)character;

/**
 设置指定文字不同颜色
 
 @param string 源字符串
 @param keywordStr 关键字
 @param color 关键字颜色
 @return 富文本文字
 */
+ (NSAttributedString *)returnAttributedString:(NSString *)string keywordStr:(NSString *)keywordStr keywordStrColor:(UIColor *)color;


/**
 画虚线
 
 @param lineView 需要画虚线的视图
 @param lineLength 虚线的长度
 @param lineSpacing 虚线的间隔宽度
 @param lineColor 虚线颜色
 */
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

/** 获取北京时间 */
+ (NSDate *)getNowDateWithDate:(NSDate *)anyDate;

/** 适配iOS 11 */
+ (void)ios11ViewTableView:(UITableView *)tableView;

/** 使用当前控制器进行push */
+ (void)pushToViewControllerWithVC:(UIViewController *)vc;


/** 返回当前版本是否有更新 YES->新版本 NO->无更新*/
+ (BOOL)getVersionIsUpdate;

/**
 数组字典 转为json字符串
 
 @param idObject 数组、字典
 @return json字符串
 */
+ (NSString *)returnJsonStringConversion:(id)idObject;

/**
 根据身份证号获取生日
 
 @param numberStr 身份证号获
 @return 生日
 */
+ (NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr;

/**
 根据身份证号性别
 
 @param numberStr 身份证号
 @return 性别
 */
+ (NSString *)getIdentityCardSex:(NSString *)numberStr;


/**
 根据身份证号获取年龄
 
 @param numberStr 身份证号
 @return 年龄
 */
+ (NSString *)getIdentityCardAge:(NSString *)numberStr;

/**
 设置文字行间距(一般设置12左右较好)
 
 @param spacingSize 行间距
 @param showText 设置的文字
 @return 富文本
 */
+ (NSMutableAttributedString *)setupTextLineSpacingSize:(CGFloat)spacingSize showText:(NSString *)showText;

@end
