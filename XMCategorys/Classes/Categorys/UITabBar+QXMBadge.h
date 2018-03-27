//
//  UITabBar+QXMBadge.h
//  QXM
//
//  Created by 张晓檬 on 16/4/6.
//  Copyright © 2016年 xiangshang360.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (QXMBadge)
- (void)showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点

@end
