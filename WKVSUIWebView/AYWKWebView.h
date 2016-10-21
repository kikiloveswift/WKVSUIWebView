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



//@protocol JSActionOCDelegate <NSObject>
//
//@required
//
//- (void)jsActionOC:(WKScriptMessage *)message;
//
//@end

@interface AYWKWebView : WKWebView<WKUIDelegate, WKNavigationDelegate>


//@property (nonatomic, weak)id<JSActionOCDelegate> jsActionDelegate;




/**
 加载的URLString
 */
@property (nonatomic, copy)NSString *requestURL;


//初始化WebView
- (instancetype)initWithFrame:(CGRect)frame configuration:(nonnull WKWebViewConfiguration *)configuration;



NS_ASSUME_NONNULL_END


@end
