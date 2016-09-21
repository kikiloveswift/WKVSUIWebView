//
//  AYHybridBridge.m
//  WKVSUIWebView
//
//  Created by kong on 16/9/20.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import "AYHybridBridge.h"

@implementation AYHybridBridge
{
    __weak WKWebView *_webView;
    __weak id<WKNavigationDelegate> navigationDelegate;
    AYHybridData *_data;
    
}

+ (instancetype)shareInstanceWith:(WKWebView *)webView
{
    AYHybridBridge *bridge = [[self alloc] init];
    [bridge setupHybridData:webView];
    
    return bridge;
}


/**
 初始化Data的代理

 @param webView 当前webView
 */
- (void)setupHybridData:(WKWebView *)webView
{
    _webView = webView;
    _webView.navigationDelegate = self;
    _data = [[AYHybridData alloc] init];
    _data.dataDelegate = self;
}


//数据源代理
#pragma mark--AYWebHybridBridgeDataDelegate
- (NSString *)evaluateJavascript:(NSString *)javascriptCommand
{
    return @"";
}

@end
