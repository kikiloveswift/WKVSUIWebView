//
//  LocalDocumentEct.m
//  WKVSUIWebView
//
//  Created by kong on 16/9/21.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import "LocalDocumentEct.h"

@implementation LocalDocumentEct

+ (NSString *)loadLocalHtmlString:(NSURL *)jsURL
{
    //搜索本地文件
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    [LocalDocumentEct searchLocalDiskIOS9:[jsURL absoluteString]];
    
    //返回路径
    
    
    return @"";
}

#pragma mark--IOS9以上取Documents
+ (NSString *)searchLocalDiskIOS9:(NSString *)urlString
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex: 0];
    NSString* documentsPath = [documentsDirectory stringByAppendingPathComponent:urlString];
    NSLog(@"documentsPath is %@",documentsPath);
    return @"";
}

#pragma mark--IOS9以下取tmp文件
+ (NSString *)searchLocalDiskIOS8:(NSString *)urlString
{
    //获取tmp路径
    NSString *temStr = NSTemporaryDirectory();
    
    return @"";
}



@end
