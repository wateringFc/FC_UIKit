//  UIScrollView+FCRefresh
//  dddd
//
//  Created by watering on 2018/4/26.
//  Copyright © 2018年 watering. All rights reserved.
//

#import "UIScrollView+FCRefresh.h"
#import <MJRefresh.h>

@implementation UIScrollView (FCRefresh)


- (void)setRefreshWithHeaderBlock:(void (^)())headerBlock
                      footerBlock:(void (^)())footerBlock{

    if (headerBlock) {
        
        MJRefreshNormalHeader *header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            if (headerBlock) {
                headerBlock();
            }
        }];
        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        self.mj_header = header;
    }
    if (footerBlock) {
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            footerBlock();
        }];
        [footer setTitle:@"暂无更多数据" forState:MJRefreshStateNoMoreData];
        [footer setTitle:@"" forState:MJRefreshStateIdle];
        footer.refreshingTitleHidden = YES;
        self.mj_footer = footer;
    }
}

- (void)headerBeginRefreshing
{
    [self.mj_header beginRefreshing];
}

- (void)headerEndRefreshing
{
    [self.mj_header endRefreshing];
}

- (void)footerEndRefreshing
{
    [self.mj_footer endRefreshing];
}

- (void)footerNoMoreData
{
    [self.mj_footer setState:MJRefreshStateNoMoreData];
}

- (void)hideFooterRefresh{
    self.mj_footer.hidden = YES;
}


- (void)hideHeaderRefresh{
    self.mj_header.hidden = YES;
}


@end
