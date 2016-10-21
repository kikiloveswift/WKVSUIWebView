//
//  AYWKScriptMessageHandler.h
//  WKVSUIWebView
//
//  Created by kong on 16/10/20.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface AYWKScriptMessageHandler : NSObject<WKScriptMessageHandler>

- (instancetype)init;

- (WKWebViewConfiguration *)registerWKWebViewConfiguration:(NSArray *)configs;

@end
