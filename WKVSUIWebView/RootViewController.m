//
//  RootViewController.m
//  WKVSUIWebView
//
//  Created by kong on 16/9/20.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import "RootViewController.h"
#import "UIWebViewController.h"
#import "WKViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)webViewAction:(id)sender
{
    UIWebViewController *webVC = [[UIWebViewController alloc] init];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (IBAction)wkAction:(id)sender
{
    WKViewController *wkVC = [[WKViewController alloc] init];
    [self.navigationController pushViewController:wkVC animated:YES];
}


@end
