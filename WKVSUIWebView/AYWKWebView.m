//
//  AYWKWebView.m
//  WKVSUIWebView
//
//  Created by kong on 16/9/21.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import "AYWKWebView.h"
#import <objc/runtime.h>
static const char *HYBRIDBRIDGE = "HYBRIDBRIDGE";

@implementation AYWKWebView


#pragma mark--SET
- (void)setBridge:(AYHybridBridge *)bridge
{
    objc_setAssociatedObject(self, HYBRIDBRIDGE, bridge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark--GET
- (AYHybridBridge *)bridge
{
    return objc_getAssociatedObject(self, HYBRIDBRIDGE);
}

//初始化浏览器
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //注入Config
        [self setUpConfig];
        //绑定bridge
        self.bridge = [AYHybridBridge shareInstanceWith:self];
        
    }
    return self;
}

//注入Config
- (void)setUpConfig
{
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *uContentController = [[WKUserContentController alloc] init];
    //addScript
    [uContentController addScriptMessageHandler:self name:@"invoke"];
    config.userContentController = uContentController;
    
    
}


- (void)addKVOOserver
{
    
}


//收到JS Message之后执行的跳转
#pragma mark-WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    
}






@end
