//
//  WKViewController.h
//  WKVSUIWebView
//
//  Created by kong on 16/9/20.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WebKit.h>

@interface WKViewController : BaseViewController<WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>

@end
