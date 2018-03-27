//
//  UIBarButtonItem+SLAddition.h
//  SLAddition
//
//  Created by shicuf on 15/1/24.
//  Copyright (c) 2015年 shicuf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SLAddition)

/**
 *  创建自定义barButtonItem
 *
 *  @param bgImageName 背景图片名字
 *  @param target    点击事件的监听者
 *  @param action    点击事件的监听方法
 *
 *  @return item
 */
+ (UIBarButtonItem *)itemWithBgImageName:(NSString *)bgImageName target:(id)target action:(SEL)action;

/**
 *  创建自定义barButtonItem
 *
 *  @param normalImageName      normal image name
 *  @param highlightedImageName highlighted image name
 *  @param target               点击事件的监听者
 *  @param action               点击事件的监听方法
 *
 *  @return item
 */
+ (UIBarButtonItem *)itemWithNormalImageName:(NSString *)normalImageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action;

/**
 *  快速创建item
 *
 *  @param title    需要显示的标题
 *  @param norImage 默认状态显示的图片
 *  @param higImage 高亮状态显示的图片
 *
 *  @return item
 */
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title norImage:(NSString *)norImage higImage:(NSString *)higImage tagert:(id)tagert action:(SEL)action;

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title norImage:(NSString *)norImage selectedImage:(NSString *)selectedImage tagert:(id)tagert action:(SEL)action;

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title color:(UIColor *)color norImage:(NSString *)norImage selectedImage:(NSString *)selectedImage tagert:(id)tagert action:(SEL)action;

@end
