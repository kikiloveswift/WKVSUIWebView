//
//  LocalDocumentEct.h
//  WKVSUIWebView
//
//  Created by kong on 16/9/21.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalDocumentEct : NSObject


/**
 返回本地目录

 @param jsString 网页JS传入的跳转路径

 @return 本地重新加载的目录
 */
+ (NSString *)loadLocalHtmlString:(NSURL *)jsURL;

@end
