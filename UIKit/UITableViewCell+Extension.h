//
//  UITableViewCell+Extension.h
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Extension)


/**
 *  创建cell
 *
 *  @param tableView 所属tableView
 *
 *  @return cell实例
 */
+ (instancetype)fc_cellWithTableView:(UITableView *)tableView;


/**
 *  cell向下移动，留出空隙
 *
 *  @param frame 原frame
 *  @param down  向下移动的距离
 *
 *  @return 新的frame
 */
- (CGRect)fc_cellMove:(CGRect)frame down:(CGFloat)down;

@end
