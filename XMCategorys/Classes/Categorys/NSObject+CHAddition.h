//
//  NSObject+CHAddition.h
//  BrilliantLoan
//
//  Created by cuoohe on 15/6/4.
//  Copyright (c) 2015年 cuoohe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CHAddition)

//验证输入的是否是正确格式的手机号
- (BOOL)isValidMobileNumber:(NSString *)mobileNum;
@end
