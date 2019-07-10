//  UIScrollView+FCRefresh
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (FCRefresh)


- (void)setRefreshWithHeaderBlock:(void(^)(void))headerBlock
                      footerBlock:(void(^)(void))footerBlock;


- (void)headerBeginRefreshing;
- (void)headerEndRefreshing;
- (void)footerEndRefreshing;
- (void)footerNoMoreData;

- (void)hideHeaderRefresh;
- (void)hideFooterRefresh;


@end
