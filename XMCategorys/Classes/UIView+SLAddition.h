//
//  UIView+SLAddition.h
//  SLAddition
//
//  Created by shicuf on 15/1/24
//  Copyright (c) 2015年 shicuf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SLAddition)
/** view 的X */
@property (nonatomic, assign) CGFloat   x;


/** View.Y*/
@property (nonatomic, assign) CGFloat   y;

/** view.maxX */
@property (nonatomic, assign,readonly) CGFloat   maxX;

/** View.maxY*/
@property (nonatomic, assign,readonly) CGFloat   maxY;

/** View.width */
@property (nonatomic, assign) CGFloat   width;

/** View.height */
@property (nonatomic, assign) CGFloat   height;

/** View's origin - Sets X and Y Positions */
@property (nonatomic, assign) CGPoint   origin;

/** View's size - Sets Width and Height */
@property (nonatomic, assign) CGSize    size;

/** view最下边到Y==0的距离 ，包含最上边的20像素 **/
@property (nonatomic, assign) CGFloat   bottom;

/** view最右边到X==0的距离 **/
@property (nonatomic, assign) CGFloat   right;

/** View.centerX **/
@property (nonatomic, assign) CGFloat   centerX;

/** view.centerY **/
@property (nonatomic, assign) CGFloat   centerY;

/** 子视图在父视图中X的相对位置 **/
@property (nonatomic, strong, readonly) UIView *lastSubviewOnX;

/** 子视图在父视图中Y的相对位置 **/
@property (nonatomic, strong, readonly) UIView *lastSubviewOnY;

/**
 从xib加载视图

 @return <#return value description#>
 */
+ (instancetype)viewFromXib;

/**
 *  返回当前视图, 所处的控制器
 *
 *  @return 控制器
 */
- (UIViewController *)currentViewController;

/**  设置圆角  */
- (void)rounded:(CGFloat)cornerRadius;

/**  设置圆角和边框  */
- (void)rounded:(CGFloat)cornerRadius width:(CGFloat)borderWidth color:(UIColor *)borderColor;

/**  设置边框  */
- (void)border:(CGFloat)borderWidth color:(UIColor *)borderColor;

/**   给哪几个角设置圆角  */
-(void)round:(CGFloat)cornerRadius RectCorners:(UIRectCorner)rectCorner;

/**  设置阴影  */
-(void)shadow:(UIColor *)shadowColor opacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset;

- (UIViewController *)viewController;

+ (CGFloat)getLabelHeightByWidth:(CGFloat)width Title:(NSString *)title font:(UIFont *)font;

- (void)removeAllSubviews;

@end
