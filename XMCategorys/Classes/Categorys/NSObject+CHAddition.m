//
//  NSObject+CHAddition.m
//  BrilliantLoan
//
//  Created by cuoohe on 15/6/4.
//  Copyright (c) 2015年 cuoohe. All rights reserved.
//

#import "NSObject+CHAddition.h"

@implementation NSObject (CHAddition)

//验证输入的是否是正确格式的手机号
- (BOOL)isValidMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,184,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,177,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,184,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2478])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,177,180,189
     22         */
    NSString * CT = @"^1((33|53|77|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    /**
     29         * 国际长途中国区(+86)
     30         * 区号：+86
     31         * 号码：十一位
     32         */
    NSString * IPH = @"^\\+861(3|5|8)\\d{9}$";
    
    //判断是否为正确格式的手机号码
    NSPredicate* regextestmobile;
    NSPredicate* regextestcm;
    NSPredicate* regextestcu;
    NSPredicate* regextestct;
    NSPredicate* regextestiph;
    
    regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    regextestiph = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", IPH];
    
    /**
     * 后台正则表达式
     */
    NSString *CM_NUM = @"^[1][3,4,5,7,8][0-9]{9}$";
    NSPredicate *phoneNum = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        || ([regextestiph evaluateWithObject:mobileNum] == YES)
        
        || ([phoneNum evaluateWithObject:mobileNum] == YES)
        
        )
    {
        return YES;
    }
    else
    {
        
        return NO;
    }
}


@end
