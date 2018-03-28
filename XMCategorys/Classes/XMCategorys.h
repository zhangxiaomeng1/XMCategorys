//
//  XMCategorys.h
//  Pods
//
//  Created by 张晓檬 on 2018/3/26.
//

#ifndef XMCategorys_h
#define XMCategorys_h

//自定义log日志输出
#ifdef DEBUG
#define QXMLog(fmt, ...)             NSLog((@"%s\n===   " fmt), __FUNCTION__, ##__VA_ARGS__);
#define QXMNSLog(fmt, ...)           NSLog((fmt), ##__VA_ARGS__);
#define CKLog(FORMAT, ...)           fprintf(stderr,"%s:%d | \%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else
#define QXMLog(...);
#define QXMNSLog(fmt, ...)
#define CKLog(FORMAT, ...) nil
#endif

#import "NSArray+Log.h"//打印
#import "NSObject+CHAddition.h"//验证手机号
#import "NSObject+runtime.h"
#import "NSString+Extension.h"
#import "NSString+SLPathAddition.h"
#import "UITextField+ZS.h"
#import "UIView+SLAddition.h"
#import "UITabBar+QXMBadge.h"
#import "UIImage+Scale.h"
#import "NSDate+SLAddition.h"
#import "NSObject+CHAddition.h"//验证手机号
#import "UIBarButtonItem+SLAddition.h"
#import "UIColor+expanded.h"
#import "UIButton+countDown.h"
#import "UILabel+Extension.h"


//宏定义
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define QXMWeakSelf __weak typeof(self) weakSelf = self;

#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)

//图片高度缩放比例
#define ImageHight(h)           Main_Screen_Height/(h)
#define ImageWidth(w)           Main_Screen_Width/(w)
// 系统控件默认高度
#define KNavHeight              ((CurrentIPhoneX)? 88:64)
#define kBottomBarHeight        (CurrentIPhoneX?   83:49)
#define KCustomNavOffsetY       (CurrentIPhoneX?   24.0f:0)//适配自定义导航条的Y值偏移量(适配iphoenX)
#define SafeAreaBottomHeight     34
#define KCustomTabBarOffsetY    (CurrentIPhoneX?   SafeAreaBottomHeight:0)//适配自定义TabBar的Y值偏移量(适配iphoenX)

// 第一个参数是当下的控制器适配iOS11 一下的，第二个参数表示scrollview或子类
#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}


#define kStatusBarHeight        (20.f)
#define KLineHeiht               1.0f
#define KCornerRadius            4.0f

#define kTopBarHeight           (38.5f)
#define kLeftNav                (10.0f)
#define kLeft                   (15.0f)
#define KCellHeight             (55.0f)
#define KCellHeight70             (70.0f)

#define KNavHeight_Nostatus      (44.f)
#define kEnglishKeyboardHeight  (216.f)
#define kChineseKeyboardHeight  (252.f)

#define kStockDetalSegmentHeight      (44.f)

//数据倍数
#define DOUBLE(NUM) (NUM*2.0f)
#define TRIPLE(NUM) (NUM*3.0f)

#define PARTTWO(NUM)   (NUM/2.0f)
#define PARTTHREE(NUM) (NUM/3.0f)

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//phone
#define CurrentIOS11           [[[UIDevice currentDevice] systemVersion] floatValue] >= 11
#define CurrentIOS10          [[[UIDevice currentDevice] systemVersion] floatValue] >= 10
#define CurrentIOS8_3          [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.3
#define CurrentIOS8            [[[UIDevice currentDevice] systemVersion] floatValue] >= 8

#define CurrentIPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640,960), [[UIScreen mainScreen] currentMode].size) : NO)

#define CurrentIPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define CurrentIPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define CurrentIPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define CurrentIPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125,2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 颜色=====
#define QXMColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define QXMAColor(r, g, b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
// 随机色
#define QXMRandomColor QXMColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
//十六进制转换成UIColor
#define QXMHex2Rgb(hexValue,alph) [UIColor colorWithRed:((hexValue & 0xFF0000) >> 16)/255.0 green:((hexValue & 0xFF00) >> 8)/255.0 blue:((hexValue & 0xFF))/255.0 alpha:(alph)]
//  tableView默认背景色
#define DEFAULTViewBackground     [UIColor colorWithRed:243/255.0f green:243/255.0f blue:243/255.0f alpha:1.0]
#define DEFAULTBGCOLOR                 [UIColor colorWithRed:241/255.0f green:241/255.0f blue:241/255.0f alpha:1.0]

#define DEFAULTRED           QXMHex2Rgb(0xF1404B, 1)
#define DEFAULTGreen         QXMHex2Rgb(0x7ed321, 1)//绿色
#define DEFAULTBEBEBE        QXMHex2Rgb(0xbebebe,1)
#define DEFAULTBLUE          QXMHex2Rgb(0xDA2F0,1)
#define DEFAULTBLUE2          QXMHex2Rgb(0x3DA2F0,1)
#define DEFAULTBLUE3          QXMHex2Rgb(0x4CB1FF,1)
#define DEFAULTPURPLE        QXMHex2Rgb(0xBA8CF2,1)
#define DEFAULTYELLOW        QXMHex2Rgb(0xFBB761,1)
#define DEFAULTYELLOW1       QXMHex2Rgb(0xFFB045,1)


#define DEFAULTBLACK0        QXMHex2Rgb(0x000000,1)
#define DEFAULTBLACK         QXMHex2Rgb(0x252C41,1)
#define DEFAULTBLACK2        QXMHex2Rgb(0x5F6576,1)
#define DEFAULTBLACK3        QXMHex2Rgb(0xA0A5B5,1)
#define DEFAULTBLACK4        QXMHex2Rgb(0x787878,1)
#define DEFAULTGREY          QXMHex2Rgb(0xbebebe,1)
#define DEFAULTLineColor     QXMHex2Rgb(0xEBEDF3,1)//横线的颜色
#define DEFAULTBackgroundColor       QXMHex2Rgb(0xf7f7f7,1)//背景的颜色
#define DEFAULTBackground2Color       QXMHex2Rgb(0xfafafa,1)//背景的颜色

#define DEFAULTWHITE         [UIColor whiteColor]
#define DEFAULTClearColor    [UIColor clearColor]
#define DEFAULTsecurityType  QXMHex2Rgb(0x13C9A9, 1)
#define DEFAULTsecurityTypeLine  QXMHex2Rgb(0x13C9A9, 0.5)


//字体大小与样式
#define NumberWithInt(_value)        [NSNumber numberWithInt:_value]
#define QXMFontReg(_size)            [UIFont systemFontOfSize:_size]
#define QXMFontBold(_size)           [UIFont boldSystemFontOfSize:_size]
#define FONT(NAME, FONTSIZE)         [UIFont fontWithName:(NAME) size:(FONTSIZE)]

#define kFont10 QXMFontReg(10)
#define kFont11 QXMFontReg(11)
#define kFont12 QXMFontReg(12)
#define kFont13 QXMFontReg(13)
#define kFont14 QXMFontReg(14)
#define kFont15 QXMFontReg(15)
#define kFont16 QXMFontReg(16)
#define kFont18 QXMFontReg(18)
#define kFont20 QXMFontReg(20)
#define kFont36 QXMFontReg(36)

#define kBFont10 QXMFontBold(10)
#define kBFont12 QXMFontBold(12)
#define kBFont14 QXMFontBold(14)
#define kBFont15 QXMFontBold(15)
#define kBFont16 QXMFontBold(16)
#define kBFont18 QXMFontBold(18)
#define kBFont20 QXMFontBold(20)
#define kBFont25 QXMFontBold(25)
#define kBFont36 QXMFontBold(36)

#endif /* XMCategorys_h */
