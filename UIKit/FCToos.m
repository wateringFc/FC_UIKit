//
//  Toos.m
//  dddd
//
//  Created by 方存 on 2019/7/10.
//  Copyright © 2019年 JKB. All rights reserved.
//

#import "Toos.h"

@implementation Toos


/**
 计算文本【宽度】
 
 @param text 计算文本
 @param textFont 文本字体大小
 @param textHeight 文本显示的固定高度
 @return 返回计算之后文本的宽度
 */
+ (CGFloat)returnTextWidthWithText:(NSString *)text Font:(UIFont *)textFont defaultHeight:(CGFloat)textHeight
{
    NSDictionary * attrs = [NSDictionary dictionaryWithObjectsAndKeys:textFont,NSFontAttributeName,nil];
    CGRect S = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, textHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    
    return S.size.width;
}


/**
 计算文本【高度】
 
 @param text 计算文本
 @param textFont 文本字体大小
 @param textWidth 文本显示的固定宽度
 @return 返回计算之后文本的高度
 */
+ (CGFloat)returenTextHeightWihtText:(NSString *)text Font:(UIFont *)textFont defaultWidth:(CGFloat)textWidth
{
    NSDictionary * attrs = [NSDictionary dictionaryWithObjectsAndKeys:textFont,NSFontAttributeName,nil];
    CGRect S = [text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    return S.size.height;
}

+ (UILabel *)createLabelWithFrame:(CGRect)lFrame Font:(UIFont *)lFont TextColor:(UIColor *)fColor TextAlignment:(NSTextAlignment)fAlignent Text:(NSString *)lText
{
    UILabel *l = [[UILabel alloc] initWithFrame:lFrame];
    l.font = lFont;
    l.textColor = fColor;
    l.textAlignment = fAlignent;
    l.text = lText;
    return l;
}

+ (UIImageView *)createImageViewWithFrame:(CGRect)iFrame Image:(UIImage *)img BackgroundColor:(UIColor *)bColor
{
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:iFrame];
    if (bColor == nil  && img != nil) {
        imgV.image = img;
    }
    if (bColor != nil) {
        imgV.backgroundColor = bColor;
    }
    return imgV;
}


+ (CGFloat)returnSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width withLineSpace:(float)lineSpace
{
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    //    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = lineSpace;
    paraStyle.hyphenationFactor = 0.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.0f
                          };
    
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return size.height;
}


/** 时间 转 时间戳 */
+ (NSInteger)returnTimeSp:(NSDate *)date
{
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    NSString *string = [NSString stringWithFormat:@"%ld",timeSp];
    return [string integerValue];
}

/**
 时间戳 转 时间字符串（固定格式）
 
 @param time 时间戳
 @return 时间字符串
 */
+ (NSString *)returnDateTime:(NSString *)time
{
    NSString *timeStr;
    if (time.length > 10) {
        timeStr = [time substringToIndex:10];
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStr doubleValue]];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}


/**
 时间 转 时间字符串（yyyy-MM-dd）
 
 @param date 时间
 @return 时间字符串
 */
+ (NSString *)returnDateToString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

/**
 时间字符串 转 时间
 
 @param string 时间字符串
 @param type 字符串形式
 @return 时间
 */
+ (NSDate *)returnStringTurnDate:(NSString *)string typeStr:(NSString *)type
{
    NSDateFormatter*dateFormatter=[[NSDateFormatter alloc]init];
    //    [dateFormatter setDateFormat:@"YYYY年MM月dd日 HH:mm:ss"];
    [dateFormatter setDateFormat: type];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}


/**
 两个时间比较大小【1:一 比 二 大】  【-1: 一 比 二 小】 【0:时间相等】
 
 @param oneDay 第一个时间
 @param anotherDay 第二个时间
 @return 【1:一 比 二 大】  【-1: 一 比 二 小】 【0:时间相等】
 */
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {
        // 第一个 比 第二个 大
        return 1;
    }else if (result == NSOrderedAscending){
        // 第一个 比 第二个 小
        return -1;
    }
    // 时间相等
    return 0;
}

/**
 计算两个时间的间隔天数
 
 @param fromDate 开始时间
 @param toDate 结束时间
 @return 间隔天数
 */
+ (int)numberOfDaysWithFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeInterval time = [fromDate timeIntervalSinceDate:toDate];
    int days = ((int)time)/(3600*24);
    return days;
}

/**
 获取当前时间
 
 @param isText YES：yyyy年MM月dd日 NO：yyyy-MM-dd
 @return 返回当前时间字符串
 */
+ (NSString *)returnCurrentDateStrShowType:(BOOL)isText
{
    // 获取当前时间
    NSDate *date = [NSDate date];
    NSDateFormatter *matter = [[NSDateFormatter alloc] init];
    if (isText) {
        matter.dateFormat = @"yyyy年MM月dd日";
    }else {
        matter.dateFormat = @"yyyy-MM-dd";
    }
    NSString *dateString = [matter stringFromDate:date];
    return dateString;
}


/**
 计算当前日期为周几
 
 @param inputDate 输入日期
 @return 周几
 */
+ (NSString*)returnWeekdayStringFromDate:(NSDate*)inputDate
{
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    NSString *str = [weekdays objectAtIndex:theComponents.weekday];
    return str;
}


/**
 返回两个时间的间隔 年 月 日
 
 @param unit 比较的依据(年月日时分秒)
 @param startDateStr 开始时间
 @param andDateStr 结束时间
 @return 日期组件
 */
+ (NSDateComponents *)returnDateIntervalComparisonType:(NSCalendarUnit)unit StartDate:(NSString *)startDateStr andDate:(NSString *)andDateStr
{
    //创建两个日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *startDate = [dateFormatter dateFromString:startDateStr];
    NSDate *endDate = [dateFormatter dateFromString:andDateStr];
    //利用NSCalendar比较日期的差异
    NSCalendar *calendar = [NSCalendar currentCalendar];
    /**
     * 要比较的时间单位,常用如下,可以同时传：
     *    NSCalendarUnitDay : 天
     *    NSCalendarUnitYear : 年
     *    NSCalendarUnitMonth : 月
     *    NSCalendarUnitHour : 时
     *    NSCalendarUnitMinute : 分
     *    NSCalendarUnitSecond : 秒
     */
    NSCalendarUnit calendarUnit = unit;//只比较天数差异
    // 比较的结果是NSDateComponents类对象
    NSDateComponents *delta = [calendar components:calendarUnit fromDate:startDate toDate:endDate options:0];
    // 在调用的时候 可以直接输出 delta 也可以通过 delta.year delta.month delta.day 输出需要是参数
    return delta;
}


/**
 根据单个字符分割
 
 @param string 原始字符串
 @param character 单个字符
 @return 分割后的数组
 */
+ (NSArray *)componentsSeparatedString:(NSString *)string character:(NSString *)character
{
    return [string componentsSeparatedByString:character];
}


/**
 根据多个字符分割
 
 @param string 原始字符串
 @param character 多个字符串（如：@"年 月 日"）
 @return 分割后的数组
 */
+ (NSArray *)componentsSeparatedStringMultipleCharacter:(NSString *)string character:(NSString *)character
{
    return [string componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:character]];
}


/**
 设置指定文字不同颜色
 
 @param string 源字符串
 @param keywordStr 关键字
 @param color 关键字颜色
 @return 富文本文字
 */
+ (NSAttributedString *)returnAttributedString:(NSString *)string keywordStr:(NSString *)keywordStr keywordStrColor:(UIColor *)color
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range = [[str string] rangeOfString: keywordStr];
    [str addAttribute:NSForegroundColorAttributeName value:color range:range];
    return str;
}


/**
 画虚线
 
 @param lineView 需要画虚线的视图
 @param lineLength 虚线的长度
 @param lineSpacing 虚线的间隔宽度
 @param lineColor 虚线颜色
 */
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGPathMoveToPoint(path1, NULL, 0, 0);
    CGPathAddLineToPoint(path1, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path1];
    CGPathRelease(path1);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

//获取北京时间
+ (NSDate *)getNowDateWithDate:(NSDate *)anyDate{
    
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc]initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}

/** 适配iOS 11 */
+ (void)ios11ViewTableView:(UITableView *)tableView
{
    if (@available(iOS 11.0, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        tableView.contentInset = UIEdgeInsetsMake(kNavHeighe, 0, kTarBarHeight, 0);
        tableView.scrollIndicatorInsets = tableView.contentInset;
    }
}

/** 使用当前控制器进行push */
+ (void)pushToViewControllerWithVC:(UIViewController *)vc {
    UITabBarController *tab = (UITabBarController *)getWindow.rootViewController;
    UINavigationController  *nvc = tab.selectedViewController;
    UIViewController *viewController = nvc.visibleViewController;
    viewController.hidesBottomBarWhenPushed = YES;
    [viewController.navigationController pushViewController:vc animated:YES];
    viewController.hidesBottomBarWhenPushed = NO;
    // 使用方法: [self PushToViewControllerWithVC:vc];
}


/** 返回当前版本是否有更新 YES->新版本 NO->无更新*/
+ (BOOL)getVersionIsUpdate
{
    NSString *key = @"CFBundleShortVersionString";
    // 获得当前软件版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    // 获得沙盒中存储的版本号
    NSString *sanboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    // 当前版本与沙盒中版本(老版本)比较,如果是降序
    if ([currentVersion compare:sanboxVersion] == NSOrderedDescending) {
        // 存储版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return YES;
    }
    return NO;
}

/**
 数组字典 转为json字符串
 
 @param idObject 数组、字典
 @return json字符串
 */
+ (NSString *)returnJsonStringConversion:(id)idObject
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:idObject options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}


/**
 根据身份证号获取生日
 
 @param numberStr 身份证号获
 @return 生日
 */
+ (NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr
{
    NSMutableString *result = [NSMutableString stringWithCapacity:0];
    NSString *year = nil;
    NSString *month = nil;
    
    BOOL isAllNumber = YES;
    NSString *day = nil;
    if([numberStr length]<14)
        return result;
    
    //**截取前14位
    NSString *fontNumer = [numberStr substringWithRange:NSMakeRange(0, 13)];
    
    //**检测前14位否全都是数字;
    const char *str = [fontNumer UTF8String];
    const char *p = str;
    while (*p!='\0') {
        if(!(*p>='0'&&*p<='9'))
            isAllNumber = NO;
        p++;
    }
    if(!isAllNumber)
        return result;
    
    year = [numberStr substringWithRange:NSMakeRange(6, 4)];
    month = [numberStr substringWithRange:NSMakeRange(10, 2)];
    day = [numberStr substringWithRange:NSMakeRange(12,2)];
    
    [result appendString:year];
    [result appendString:@"-"];
    [result appendString:month];
    [result appendString:@"-"];
    [result appendString:day];
    return result;
}

/**
 根据身份证号性别
 
 @param numberStr 身份证号
 @return 性别
 */
+ (NSString *)getIdentityCardSex:(NSString *)numberStr
{
    int sexInt=[[numberStr substringWithRange:NSMakeRange(16,1)] intValue];
    if(sexInt%2 != 0){
        return @"男";
    }else{
        return @"女";
    }
}

/**
 根据身份证号获取年龄
 
 @param numberStr 身份证号
 @return 年龄
 */
+ (NSString *)getIdentityCardAge:(NSString *)numberStr
{
    //截取身份证的出生日期并转换为日期格式
    NSString *dateStr = [self birthdayStrFromIdentityCard:numberStr];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-mm-dd";
    NSDate *birthDate =  [formatter dateFromString:dateStr];
    NSTimeInterval dateDiff = [birthDate timeIntervalSinceNow];
    // 计算年龄
    int age  =  trunc(dateDiff/(60*60*24))/365;
    NSString *ageStr = [NSString stringWithFormat:@"%d", -age];
    return ageStr;
}


/**
 设置文字行间距(一般设置12左右较好)
 
 @param spacingSize 行间距
 @param showText 设置的文字
 @return 富文本
 */
+ (NSMutableAttributedString *)setupTextLineSpacingSize:(CGFloat)spacingSize showText:(NSString *)showText
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:showText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:spacingSize];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [showText length])];
    return  attributedString;
}



@end
