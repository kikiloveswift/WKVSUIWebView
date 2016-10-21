//
//  AYWKScriptMessageHandler.m
//  WKVSUIWebView
//
//  Created by kong on 16/10/20.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import "AYWKScriptMessageHandler.h"

@implementation AYWKScriptMessageHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma Mark--WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    
}

- (WKWebViewConfiguration *)registerWKWebViewConfiguration:(NSArray *)configs
{
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *uContentController = [[WKUserContentController alloc] init];
    //addScript
    for (NSString *str in configs)
    {
        [uContentController addScriptMessageHandler:self name:str];
    }
    config.userContentController = uContentController;
    
    return config;
}

@end
