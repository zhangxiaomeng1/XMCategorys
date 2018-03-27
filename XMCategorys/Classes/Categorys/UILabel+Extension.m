//
//  UILabel+Extension.m
//  QXM
//
//  Created by 张晓檬 on 2017/5/9.
//  Copyright © 2017年 xiangshang360.com. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

- (UILabel *)initLabelMasonBgColor:(UIColor *)bgColor textColor:(UIColor *)tColor font:(UIFont *)f textLabel:(NSString *)textLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    if (bgColor) {
        label.backgroundColor = bgColor;
    }
    label.textColor = tColor;
    label.font = [UIFont systemFontOfSize:14];
    if (f) {
        label.font = f;
    }
    label.text = @"";
    if ([self isStringOk:textLabel]) {
        label.text = textLabel;
    }
    return label;
}
- (BOOL)isStringOk:(NSString *)str{
    if (![str isKindOfClass:[NSString class]]) {
        return NO;
    }
    if ([[str lowercaseString] isEqualToString:@"(null)"]) {
        return NO;
    }
    if ([[str lowercaseString] isEqualToString:@"<null>"]) {
        return NO;
    }
    if ([[str lowercaseString] isEqualToString:@"null"]) {
        return NO;
    }
    if (str != nil && [str length] >0 && ![@"" isEqualToString:str]) {
        return YES;
    }else {
        return NO;
    }
}

@end
