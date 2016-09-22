//
//  AYWKWebView.h
//  WKVSUIWebView
//
//  Created by kong on 16/9/21.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "AYHybridBridge.h"

NS_ASSUME_NONNULL_BEGIN



@protocol JSActionOCDelegate <NSObject>

@required

- (void)jsActionOC:(WKScriptMessage *)message;

@end

typedef void(^JSToOCMessageHandle)(WKScriptMessage *message);

@interface AYWKWebView : WKWebView<WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>


@property (nonatomic, weak)id<JSActionOCDelegate> jsActionDelegate;

@property(nonatomic, strong) AYHybridBridge *bridge;


/**
 JS调用OC的代理
 */
//@property(nonatomic, weak)id<JSToOCDelegate> actionOCDelegate;


/**
 JS调OC Block
 */
@property (nonatomic, copy)JSToOCMessageHandle messageHandle;

/**
 加载的URLString
 */
@property (nonatomic, copy)NSString *requestURL;

//初始化WebView
- (instancetype)initWithFrame:(CGRect)frame configuration:(nonnull WKWebViewConfiguration *)configuration;


//加载HTML
- (void)loadLocalHtml:( NSString *)urlString;


NS_ASSUME_NONNULL_END


@end
