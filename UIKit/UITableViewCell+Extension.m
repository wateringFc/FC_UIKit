//
//  UITableViewCell+Extension.m
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UITableViewCell+Extension.h"

@implementation UITableViewCell (Extension)

/**
 *  创建cell
 *
 *  @param tableView 所属tableView
 *
 *  @return cell实例
 */
+ (instancetype)fc_cellWithTableView:(UITableView *)tableView{
    
    static NSString *rid = @"cellID";
    
    //从缓存池中取出cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];
    
    //缓存池中无数据
    if(cell == nil){
        
    }
    
    return cell;
}



/**
 *  cell向下移动，留出空隙
 *
 *  @param frame 原frame
 *  @param down  向下移动的距离
 *
 *  @return 新的frame
 */
- (CGRect)fc_cellMove:(CGRect)frame down:(CGFloat)down{
    
    CGFloat topMargin = down;
    
    frame.origin.y+=topMargin;
    
    frame.size.height-=topMargin;
    
    return frame;
}

@end
