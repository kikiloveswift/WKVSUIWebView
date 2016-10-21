//
//  LocalDocumentEct.m
//  WKVSUIWebView
//
//  Created by kong on 16/9/21.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import "LocalDocumentEct.h"

@implementation LocalDocumentEct

+ (NSString *)loadLocalHtmlString:(NSString *)jsURLString
{
    //搜索本地文件
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    
    //处理jsURL --->把jsURLString转为本地需要的路径
    
    
    
    //iOS9存取文件
    [LocalDocumentEct searchLocalDiskIOS9:jsURLString];
    
    //iOS8取文件
    [LocalDocumentEct searchLocalDiskIOS8:jsURLString];
    
    //返回路径
    
    
    return @"";
}

//事例
///aoyou/m.aoyou.com/m.aoyou.com/s/LocalTour/detail.html
#pragma mark--IOS9以上取Documents
+ (NSString *)searchLocalDiskIOS9:(NSString *)urlString
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex: 0];
    NSString* documentsPath = [documentsDirectory stringByAppendingPathComponent:urlString];
    NSLog(@"documentsPath is %@",documentsPath);
    return documentsPath;
}

#pragma mark--IOS9以下取tmp文件
+ (NSString *)searchLocalDiskIOS8:(NSString *)urlString
{
    //获取tmp路径
    NSString *temStr = NSTemporaryDirectory();
    NSLog(@"temStr is %@",temStr);
    temStr = [temStr stringByAppendingFormat:@"/%@",urlString];
    return temStr;
}






@end
