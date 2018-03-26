//
//  NSString+SLPathAddition.h
//  ModelProject
//
//  Created by shicuf on 15/3/21.
//  Copyright (c) 2015年 shicuf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SLPathAddition)

/**
 *  追加文档目录
 */
- (NSString *)appendDocumentDir;

/**
 *  追加缓存目录
 */
- (NSString *)appendCacheDir;

/**
 *  追加临时目录
 */
- (NSString *)appendTempDir;


@end
