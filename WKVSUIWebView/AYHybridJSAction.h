//
//  AYHybridJSAction.h
//  WKVSUIWebView
//
//  Created by kong on 16/10/20.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AYHybridBridge.h"

@protocol JSInteractionWithOCDelegate <NSObject>

@required


/**
 JS调用OC

 @param message JS调用OC获得的返回内容
 */
- (void)jsActionOC:(WKScriptMessage *)message;

@required


/**
 OC调用JS

 @param javaScriptString OC调用JS的方法
 */
- (void)evaluateJavaScript:(NSString *)javaScriptString;

@end

@interface AYHybridJSAction : NSObject<WKUIDelegate, WKScriptMessageHandler>

- (instancetype)init;

@property (nonatomic, assign) id<JSInteractionWithOCDelegate> delegate;

@end
