//
//  AYHybridBridge.h
//  WKVSUIWebView
//
//  Created by kong on 16/9/20.
//  Copyright © 2016年 konglee. All rights reserved.
//
#if (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_1)

#define WKWebKitAvailable
#endif
#if defined(WKWebKitAvailable)

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>
#import "AYHybridData.h"

#endif


@interface AYHybridBridge : NSObject<WKNavigationDelegate,AYWebHybridBridgeDataDelegate>


/**
 初始化Bridge调用的Method

 @param webView WKWebView

 @return 实例
 */
+ (instancetype)shareInstanceWith:(WKWebView *)webView;




@end
