//
//  UITextField+ZS.h
//  BeeTool
//
//  Created by shuai on 15/4/28.
//  Copyright (c) 2015年 搜狐. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface UITextField(ZS)
/**
 *  设置可输入文字的最大长度
 *
 */
@property(nonatomic,assign)NSInteger maxtextLength;
//是否对中英文敏感   def:NO   eg:if,yes  @"OC你好"  = 6
@property(nonatomic,assign)BOOL sensitiveWithChinese;
@end
