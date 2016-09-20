//
//  UIWebViewController.m
//  WKVSUIWebView
//
//  Created by kong on 16/9/20.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import "UIWebViewController.h"

@interface UIWebViewController ()

@property(nonatomic, strong)UIWebView *webView;

@end

@implementation UIWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UIWebView";
    [self initUI];
}

- (void)initUI
{
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KHeight)];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.aoyou.com"]]];
    [self.view addSubview:_webView];
}


@end
