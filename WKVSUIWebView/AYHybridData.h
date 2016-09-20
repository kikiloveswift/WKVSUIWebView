//
//  AYHybridData.h
//  WKVSUIWebView
//
//  Created by kong on 16/9/20.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>

@protocol AYWebHybridBridgeDataDelegate <NSObject>

- (NSString *)evaluateJavascript:(NSString*)javascriptCommand;

@end
@interface AYHybridData : NSObject

@property (nonatomic, weak)id <AYWebHybridBridgeDataDelegate>dataDelegate;

- (instancetype)init;

@end
