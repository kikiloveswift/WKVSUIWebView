//
//  AYWKWebView.h
//  WKVSUIWebView
//
//  Created by kong on 16/9/21.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "AYHybridBridge.h"

typedef void(^JSToOCMessageHandle)(WKScriptMessage *message);

@interface AYWKWebView : WKWebView<WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>

@property(nonatomic, strong) AYHybridBridge *bridge;


/**
 JS调用OC的代理
 */
//@property(nonatomic, weak)id<JSToOCDelegate> actionOCDelegate;


/**
 JS调OC Block
 */
@property (nonatomic, copy)JSToOCMessageHandle messageHandle;

- (instancetype)initWithFrame:(CGRect)frame;


@end
