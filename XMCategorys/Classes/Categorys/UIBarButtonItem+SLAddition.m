//
//  UIBarButtonItem+SLAddition.m
//  SLAddition
//
//  Created by shicuf on 15/1/24.
//  Copyright (c) 2015年 shicuf. All rights reserved.
//

#import "UIBarButtonItem+SLAddition.h"

@implementation UIBarButtonItem (SLAddition)

+ (UIBarButtonItem *)itemWithBgImageName:(NSString *)bgImageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    
    if (bgImageName != nil && ![bgImageName isEqualToString:@""]) {
        [button setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    }
    // 设置按钮的尺寸为背景图片的尺寸
    CGRect frame = button.frame;
    frame.size = button.currentBackgroundImage.size;
    button.frame = frame;
    
    // 监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)itemWithNormalImageName:(NSString *)normalImageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    
    if (normalImageName != nil && ![normalImageName isEqualToString:@""]) {
        [button setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
    }
    
    if (highlightedImageName != nil && [highlightedImageName isEqualToString:@""]) {
        [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    }
    
    CGRect frame = button.frame;
    frame.size = button.currentImage.size;
    button.frame = frame;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title norImage:(NSString *)norImage higImage:(NSString *)higImage tagert:(id)tagert action:(SEL)action
{
    // 1.创建按钮 =====//左边item
//        QXMRightBarButtonItem *btn = [[QXMRightBarButtonItem alloc] init];
    
        UIButton *btn = [[UIButton alloc] init];

    // 2.设置图片
    // CUICatalog: Invalid asset name supplied: (null)
    // 如果图片不存在(nil @""), 那么就会报如下错误, 从Xcode5开始的
    if (norImage != nil && ![norImage isEqualToString:@""]) {
        
        [btn setImage:[UIImage imageNamed:norImage] forState:UIControlStateNormal];
    }
    if (higImage != nil && ![higImage isEqualToString:@""]) {
        [btn setImage:[UIImage imageNamed:higImage] forState:UIControlStateHighlighted];
    }
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);

    // 3.设置标题
    if (title != nil && ![title isEqualToString:@""]) {
        
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn setTitleColor:[UIColor colorWithRed:((0x252C41 & 0xFF0000) >> 16)/255.0 green:((0x252C41 & 0xFF00) >> 8)/255.0 blue:((0x252C41 & 0xFF))/255.0 alpha:(1)] forState:UIControlStateNormal];
    }
    // 4.自动调整控件以及子控件的frame
    [btn sizeToFit];
    
    // 5.监听按钮的点击事件
    [btn addTarget:tagert action:action forControlEvents:UIControlEventTouchUpInside];
    
    // 6.创建item
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title norImage:(NSString *)norImage selectedImage:(NSString *)selectedImage tagert:(id)tagert action:(SEL)action{
    // 1.创建按钮 右边item
    //        QXMRightBarButtonItem *btn = [[QXMRightBarButtonItem alloc] init];
    
    UIButton *btn = [[UIButton alloc] init];
    
    // 2.设置图片
    // CUICatalog: Invalid asset name supplied: (null)
    // 如果图片不存在(nil @""), 那么就会报如下错误, 从Xcode5开始的
    if (norImage != nil && ![norImage isEqualToString:@""]) {
        
        [btn setImage:[UIImage imageNamed:norImage] forState:UIControlStateNormal];
    }
    if (selectedImage != nil && ![selectedImage isEqualToString:@""]) {
        [btn setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    }
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);

    // 3.设置标题
    if (title != nil && ![title isEqualToString:@""]) {
        
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:[UIColor colorWithRed:((0x000000 & 0xFF0000) >> 16)/255.0 green:((0x000000 & 0xFF00) >> 8)/255.0 blue:((0x000000 & 0xFF))/255.0 alpha:(1)] forState:UIControlStateNormal];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    }
    // 4.自动调整控件以及子控件的frame
    [btn sizeToFit];
    
    // 5.监听按钮的点击事件
    [btn addTarget:tagert action:action forControlEvents:UIControlEventTouchUpInside];
    
    // 6.创建item
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title color:(UIColor *)color norImage:(NSString *)norImage selectedImage:(NSString *)selectedImage tagert:(id)tagert action:(SEL)action{
    // 1.创建按钮 右边item
    //        QXMRightBarButtonItem *btn = [[QXMRightBarButtonItem alloc] init];
    
    UIButton *btn = [[UIButton alloc] init];
    
    // 2.设置图片
    // CUICatalog: Invalid asset name supplied: (null)
    // 如果图片不存在(nil @""), 那么就会报如下错误, 从Xcode5开始的
    if (norImage != nil && ![norImage isEqualToString:@""]) {
        
        [btn setImage:[UIImage imageNamed:norImage] forState:UIControlStateNormal];
    }
    if (selectedImage != nil && ![selectedImage isEqualToString:@""]) {
        [btn setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    }
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    
    // 3.设置标题
    if (title != nil && ![title isEqualToString:@""]) {
        
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitleColor:color forState:UIControlStateNormal];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    }
    // 4.自动调整控件以及子控件的frame
    [btn sizeToFit];
    
    // 5.监听按钮的点击事件
    [btn addTarget:tagert action:action forControlEvents:UIControlEventTouchUpInside];
    
    // 6.创建item
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
