//
//  UITextField+UserInput.h
//  CoreData01
//
//  Created by 程立卿 on 16/2/1.
//  Copyright © 2016年 Profile. All rights reserved.
//

#import <UIKit/UIKit.h>

// 限制用户输入的是什么
typedef NS_ENUM(NSUInteger, UITextFieldLimitType) {
    /// 字母 0-9
    UITextFieldLimitTypeNumber = 0,
    /// 文字 [a-z][A-Z]
    UITextFieldLimitTypeWord,
    /// 文字下划线 [a-z][A-Z]_
    UITextFieldLimitTypeWord_,
    /// 文字数字
    UITextFieldLimitTypeWordNumber,

    //    2位整数+4位小数
    UITextFieldLimitTypeNumber2,
//    4位整数+2位小数
    UITextFieldLimitTypeNumber5,
    
    UITextFieldLimitTypeNumber7,
};

@interface UITextField (UserInput)
@property (nonatomic, assign) UITextFieldLimitType textFieldLimitType;
@property (strong, nonatomic) NSString *str;
// 添加用户输入限制
- (void)addLimitWithType:(UITextFieldLimitType)UITextFieldLimitType;

@end
