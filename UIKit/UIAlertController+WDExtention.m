//
//  UIAlertController+FCExtention.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UIAlertController+FCExtention.h"

@implementation UIAlertController (FCExtention)

+ (UIAlertController *)fc_alterWithTitle:(NSString *)title
                                 message:(NSString *)message
                            okButtonName:(NSString *)okButtonName
                        cancalButtonName:(NSString *)cancalButtonName
                             placeholder:(NSString *)placeholder
                               sureBlock:(void(^)(NSString *content))sureBlock{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancaleAction = [UIAlertAction actionWithTitle:cancalButtonName style:UIAlertActionStyleDefault handler:nil];
    //增加取消按钮；
    [alertController addAction:cancaleAction];
    
    UIAlertAction * sureAction = [UIAlertAction actionWithTitle:okButtonName
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            
                                                            UITextField * firstKeywordTF = [[UITextField alloc]init];
                                                            
                                                            NSArray * textFieldArr = @[firstKeywordTF];
                                                            
                                                            textFieldArr = alertController.textFields;
                                                            
                                                            UITextField * tf1 = alertController.textFields[0];
                                                            
                                                            sureBlock(tf1.text);
                                                        }];
    
    //增加确定按钮；
    [alertController addAction:sureAction];
    
    //定义输入框；
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = placeholder;
        textField.layer.cornerRadius = 5;
    }];
    
    [sureAction setValue:G_MainColor forKey:@"_titleTextColor"];
    [cancaleAction setValue:G_MainColor forKey:@"_titleTextColor"];
    
    return alertController;
}

+ (UIAlertController *)fc_alterWithTitle:(NSString *)title
                                 message:(NSString *)message
                            okButtonName:(NSString *)okButtonName
                        cancalButtonName:(NSString *)cancalButtonName
                             placeholder:(NSString *)placeholder
                               sureBlock:(void(^)(NSString *content))sureBlock
                               failBlock:(void(^)(void))failBlock{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * cancaleAction = [UIAlertAction actionWithTitle:cancalButtonName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        failBlock();
    }];
    //增加取消按钮；
    [alertController addAction:cancaleAction];
    
    UIAlertAction * sureAction = [UIAlertAction actionWithTitle:okButtonName
                                                          style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            
                                                            UITextField * firstKeywordTF = [[UITextField alloc]init];
                                                            
                                                            NSArray * textFieldArr = @[firstKeywordTF];
                                                            
                                                            textFieldArr = alertController.textFields;
                                                            
                                                            UITextField * tf1 = alertController.textFields[0];
                                                            
                                                            sureBlock(tf1.text);
                                                        }];
    
    //增加确定按钮；
    [alertController addAction:sureAction];
    
    //定义输入框；
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = placeholder;
        textField.layer.cornerRadius = 5;
    }];
    
    [sureAction setValue:G_MainColor forKey:@"_titleTextColor"];
    [cancaleAction setValue:G_MainColor forKey:@"_titleTextColor"];
    
    return alertController;
}



+ (UIAlertController *)fc_alterSheetWithTitle:(NSString *)title
                                      message:(NSString *)message
                                 okButtonName:(NSArray *)okButtonNameArray
                               sureBlock:(void(^)(NSString *content))sureBlock{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc] initWithString:title];
    [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, [[AttributedStr string] length])];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:G_TextGreyColor range:NSMakeRange(0, [[AttributedStr string] length])];
    [alertController setValue:AttributedStr forKey:@"attributedTitle"];
    
    for(int i=0; i<okButtonNameArray.count; i++){
        UIAlertAction * sureAction = [UIAlertAction actionWithTitle:okButtonNameArray[i]
                                                              style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * _Nonnull action) {
                                                                sureBlock(okButtonNameArray[i]);
                                                            }];
      
        [sureAction setValue:G_TextGreyColor forKey:@"titleTextColor"];
        //增加确定按钮；
        [alertController addAction:sureAction];
    }
    
    UIAlertAction * cancal = [UIAlertAction actionWithTitle:@"取消"
                                                          style:UIAlertActionStyleCancel
                                                    handler:nil];
    
    [cancal setValue:G_TextGreyColor forKey:@"titleTextColor"];
    //增加确定按钮；
    [alertController addAction:cancal];
    
    return alertController;
}

+ (UIAlertController *)fc_alterControllerWithTitle:(NSString *)title
                                           content:(NSString *)content
                                      okButtonName:(NSString *)okButtonName
                                  cancalButtonName:(NSString *)cancalButtonName
                                         sureBlock:(void(^)(void))sureBlock{
    
    UIAlertController *alterController = [UIAlertController alertControllerWithTitle:title
                                                                             message:content
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:okButtonName
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           sureBlock();
                                                       }];
    [sureAction setValue:G_MainColor forKey:@"_titleTextColor"];
    
    UIAlertAction *cancaleAction = [UIAlertAction actionWithTitle:cancalButtonName
                                                            style:UIAlertActionStyleDefault
                                                          handler:nil];
    [cancaleAction setValue:G_MainColor forKey:@"_titleTextColor"];
    
    [alterController addAction:cancaleAction];
    [alterController addAction:sureAction];
    
    return alterController;
}

@end
