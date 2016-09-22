//
//  WKNewHybridViewController.m
//  WKVSUIWebView
//
//  Created by kong on 16/9/22.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import "WKNewHybridViewController.h"
#import "AYWKWebView.h"

@interface WKNewHybridViewController ()<JSActionOCDelegate>

@property (nonatomic, strong) AYWKWebView *webView;

@end

@implementation WKNewHybridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _webView = [[AYWKWebView alloc] initWithFrame:CGRectMake(0, 64, KWidth, KHeight)];
    _webView.jsActionDelegate = self;
}

#pragma mark-JSActionOCDelegate
- (void)jsActionOC:(WKScriptMessage *)message
{
    if ([message.name isEqualToString:@""])
    {
        
    }
    
}




@end
