//
//  UITextField+UserInput.m
//  CoreData01
//
//  Created by 程立卿 on 16/2/1.
//  Copyright © 2016年 Profile. All rights reserved.
//

#import "UITextField+UserInput.h"

#import <objc/runtime.h>

@implementation UITextField (UserInput)
- (void)addLimitWithType:(UITextFieldLimitType)UITextFieldLimitType {
    // 监听文本变化
    [self addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
}
     
- (void)textFieldChanged:(UITextField *)textField {
    NSString *regex;
    switch (self.textFieldLimitType) {
        case UITextFieldLimitTypeNumber: {
            
            NSRange range = [self.text rangeOfString:@"."];
            if (range.location != NSNotFound) {
                regex = @"[0-9]{0,8}+[.]{0,1}+[0-9]{0,2}";
            } else {
                regex = @"[0-9]{0,8}+[.]{0,1}";
            }
            
        } break;
         
        case UITextFieldLimitTypeNumber2: {
            NSRange range = [self.text rangeOfString:@"."];
            if (range.location != NSNotFound) {
                regex = @"[0-9]{0,2}+[.]{0,3}+[0-9]{0,4}";
            } else {
                regex = @"[0-9]{0,2}+[.]{0,3}";
            }
        } break;

        case UITextFieldLimitTypeNumber5: {
            NSRange range = [self.text rangeOfString:@"."];
            if (range.location != NSNotFound) {
                regex = @"[0-9]{0,5}+[.]{0,1}+[0-9]{0,2}";
            } else {
                regex = @"[0-9]{0,5}+[.]{0,1}";
            }

        } break;
        
        case UITextFieldLimitTypeNumber7: {
            NSRange range = [self.text rangeOfString:@"."];
            if (range.location != NSNotFound) {
                regex = @"[0-9]{0,7}+[.]{0,1}+[0-9]{0,2}";
            } else {
                regex = @"[0-9]{0,7}+[.]{0,1}";
            }
            
        } break;
            
        case UITextFieldLimitTypeWord: {
            regex = @"[a-zA-Z]{0,}";
        } break;
        case UITextFieldLimitTypeWord_: {
            regex = @"[a-zA-Z_]{0,}";
        } break;
        case UITextFieldLimitTypeWordNumber: {
            
        } break;
        default:
            regex = @"[.]{0,}";
            break;
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([predicate evaluateWithObject:self.text]) {
        // 符合正则
    } else {
        // 不符合
        if (self.text.length<=0) return;
        self.text = [self.text substringToIndex:self.text.length-1];
        NSLog(@"不符合规则");
    }
}

// addProperty
static void *strKey = &strKey;
-(void)setStr:(NSString *)str
{
    objc_setAssociatedObject(self, & strKey, str, OBJC_ASSOCIATION_COPY);
}

-(NSString *)str
{
    return objc_getAssociatedObject(self, &strKey);
}

static void *textFieldLimitTypeKey = &textFieldLimitTypeKey;
- (void)setTextFieldLimitType:(UITextFieldLimitType)textFieldLimitType {
    objc_setAssociatedObject(self, &textFieldLimitTypeKey, @(textFieldLimitType), OBJC_ASSOCIATION_ASSIGN);
}
- (UITextFieldLimitType)textFieldLimitType {
    return [objc_getAssociatedObject(self, &textFieldLimitTypeKey) intValue];
}

@end
