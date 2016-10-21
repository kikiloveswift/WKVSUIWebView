//
//  TestHybridViewController.m
//  WKVSUIWebView
//
//  Created by kong on 16/10/20.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import "TestHybridViewController.h"
#import "AYWKWebView.h"
#import "AYWKScriptMessageHandler.h"

@interface TestHybridViewController ()
{
    AYWKScriptMessageHandler *_handler;
    AYWKWebView *_wkWebView;
}

@end

@implementation TestHybridViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //1. 初始化handler
    _handler = [[AYWKScriptMessageHandler alloc] init];
    
    //2. 初始化WebView
    _wkWebView = [[AYWKWebView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KHeight-64) configuration:[_handler registerWKWebViewConfiguration:@[]]];
    
    //3. 赋值URL
    _wkWebView.requestURL = @"https://www.baidu.com";
    
    //4. Add
    [self.view addSubview:_wkWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
