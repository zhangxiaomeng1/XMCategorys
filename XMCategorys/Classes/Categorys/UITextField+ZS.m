//
//  UITextField+ZS.m
//  BeeTool
//
//  Created by shuai on 15/4/28.
//  Copyright (c) 2015年 搜狐. All rights reserved.
//

#import "UITextField+ZS.h"
#import <objc/runtime.h>
@implementation UITextField(ZS)
static char lengthKey;
static char senKey;

static char oleStrKey2;
-(void)setOldStr:(NSString *)oldStr{
    objc_setAssociatedObject(self, &oleStrKey2, oldStr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)oldStr{
    return objc_getAssociatedObject(self, &oleStrKey2);
}

-(BOOL)hasMarkedCharacter{
    UITextRange  * markedRange = [self markedTextRange];
    UITextPosition * position = [self positionFromPosition:markedRange.start offset:0];
    if (position) {
        return YES;
    }
    return NO;
}

-(NSInteger)maxtextLength{
    return [objc_getAssociatedObject(self, &lengthKey) integerValue];
}
-(void)setSensitiveWithChinese:(BOOL)sensitiveWithChinese{
    objc_setAssociatedObject(self, &senKey, @(sensitiveWithChinese), OBJC_ASSOCIATION_RETAIN);
}
-(BOOL)sensitiveWithChinese{
    return [objc_getAssociatedObject(self, &senKey) boolValue];
}
-(void)setMaxtextLength:(NSInteger)maxtextLength{
    objc_setAssociatedObject(self, &lengthKey, @(maxtextLength), OBJC_ASSOCIATION_RETAIN);
    [self addTarget:self action:@selector(judgeLength:) forControlEvents:UIControlEventEditingChanged];
}

-(void)judgeLength:(UITextField *)textField{
    NSInteger limitLength = [objc_getAssociatedObject(self, &lengthKey) integerValue];
    BOOL sentive = [objc_getAssociatedObject(self, &senKey) boolValue];
    if (![self hasMarkedCharacter]) {
        CGFloat length = 0;
        NSString *oldStr = [self oldStr];
        NSString *newStr = self.text;
        if (sentive) {
            length = [self cStringLength:newStr];
            if(length > limitLength){
                // 改变旧串
                if (oldStr) { // 旧串为空的时候就是开始超限
                    oldStr = [self change:newStr withOleSting:oldStr withMaxLength:limitLength];
                }else{
                    oldStr = [self change:newStr withOleSting:@"1" withMaxLength:limitLength];
                }
                [self setOldStr:oldStr];
                self.text = oldStr;
            }else{
                self.text = newStr;
                [self setOldStr:newStr];
            }
//            NSLog(@"oldStr %@",oldStr);
//            NSLog(@"newStr %@",newStr);
            
        }else{
            length = self.text.length;
            if (length > limitLength) {
                self.text = [self.text substringWithRange:NSMakeRange(0, limitLength)];
            }
        }
    }
}
// 改变旧字符串
- (NSString *)change:(NSString *)newString withOleSting:(NSString *)oldSting withMaxLength:(NSInteger)maxLength{
    NSMutableString *mtuOldStr = [NSMutableString stringWithString:oldSting];
    NSMutableString *mtuNewStr = [NSMutableString stringWithString:newString];
    for (NSInteger i = oldSting.length; i < newString.length; i++) {
        
        if ([self cStringLength:[mtuNewStr substringToIndex:i]] <= maxLength) {
            mtuOldStr = [NSMutableString stringWithString:[mtuNewStr substringToIndex:i]];
        }else{
            break;
        }
    }
    return mtuOldStr.copy;
}
//-(void)judgeLength:(UITextField *)textField{
//    NSInteger limitLength = [objc_getAssociatedObject(self, &lengthKey) integerValue];
//    BOOL sentive = [objc_getAssociatedObject(self, &senKey) boolValue];
//    if (![self hasMarkedCharacter]) {
//        CGFloat length = 0;
//        if (sentive) {
//            length = [self cStringLength:self.text];
//            if(length>limitLength){
//                if (length == limitLength+1) {
//                    NSString * str = [self.text substringFromIndex:self.text.length-1];
//                    if ([self cStringLength:str] == 2) {
//                        self.text = [self.text substringToIndex:self.text.length-1];
//                        return;
//                    }
//                }
//                NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//                const char * cStr = [self.text cStringUsingEncoding:gbkEncoding];
//                char newCStr[100];
//                strcpy(newCStr, cStr);
//                char * lastCStr = substring(newCStr, 0, (int)limitLength);
//                NSString * text = [NSString stringWithCString:lastCStr encoding:gbkEncoding];
//                NSString *str  = textField.text;
//                self.text = text;
//                if (!text) {
//                    if (str) {
//                        if (limitLength %2 == 0) {
//                            self.text = [str substringWithRange:NSMakeRange(0, limitLength/2)];
//                        }else{
//                            if (limitLength - 1 >0) {
//                                self.text = [str substringWithRange:NSMakeRange(0, (limitLength-1)/2)];
//                            }
//                        }
//                    }
//                }
//            }
//        }else{
//            length = self.text.length;
//            if (length > limitLength) {
//                self.text = [self.text substringWithRange:NSMakeRange(0, limitLength)];
//            }
//        }
//    }
//}
char* substring(char* ch,int pos,int length) {
      char* pch=ch;
   //定义一个字符指针，指向传递进来的ch地址。
      char* subch=(char*)calloc(sizeof(char),length+1);
   //通过calloc来分配一个length长度的字符数组，返回的是字符指针。
      int i;
   //只有在C99下for循环中才可以声明变量，这里写在外面，提高兼容性。
       pch=pch+pos;
   //是pch指针指向pos位置。
       for(i=0;i<length;i++)
       {
        subch[i]=*(pch++);
         //循环遍历赋值数组。
        }
       subch[length]='\0';//加上字符串结束符。
       return subch;       //返回分配的字符数组地址。  
}
-(NSInteger)cStringLength:(NSString *)text{
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    const char * cStr = [text cStringUsingEncoding:gbkEncoding];
    NSInteger length = strlen(cStr);
    return length;
}
@end
