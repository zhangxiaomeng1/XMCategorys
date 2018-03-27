//
//  UIImage+Scale.m
//  xiangshangV3
//
//  Created by fang yang on 16/10/18.
//  Copyright © 2016年 xiangshang360. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage (Scale)

- (UIImage *)TransformtoSize:(CGSize)Newsize
{
    UIGraphicsBeginImageContextWithOptions(Newsize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, Newsize.width, Newsize.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
