//
//  UIAlertController+FCExtention.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (WDExtention)

+ (UIAlertController *)fc_alterWithTitle:(NSString *)title
                                 message:(NSString *)message
                            okButtonName:(NSString *)okButtonName
                        cancalButtonName:(NSString *)cancalButtonName
                             placeholder:(NSString *)placeholder
                               sureBlock:(void(^)(NSString *content))sureBlock;

+ (UIAlertController *)fc_alterSheetWithTitle:(NSString *)title
                                      message:(NSString *)message
                                 okButtonName:(NSArray *)okButtonNameArray
                                    sureBlock:(void(^)(NSString *content))sureBlock;

+ (UIAlertController *)fc_alterControllerWithTitle:(NSString *)title
                                           content:(NSString *)content
                                      okButtonName:(NSString *)okButtonName
                                  cancalButtonName:(NSString *)cancalButtonName
                                         sureBlock:(void(^)(void))sureBlock;


+ (UIAlertController *)fc_alterWithTitle:(NSString *)title
                                 message:(NSString *)message
                            okButtonName:(NSString *)okButtonName
                        cancalButtonName:(NSString *)cancalButtonName
                             placeholder:(NSString *)placeholder
                               sureBlock:(void(^)(NSString *content))sureBlock
                               failBlock:(void(^)(void))failBlock;
@end
