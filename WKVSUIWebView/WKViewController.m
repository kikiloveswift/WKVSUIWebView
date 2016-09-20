//
//  WKViewController.m
//  WKVSUIWebView
//
//  Created by kong on 16/9/20.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import "WKViewController.h"
#define LoadURL @"http://192.168.0.12:8080/JSCoreTest-1/index.html"
#define LocalHosts @"192.168.0.12"


@interface WKViewController ()

@property(nonatomic, strong)WKWebView *webView;

@property(nonatomic, weak)CALayer *progresslayer;

@property(nonatomic, strong)WKUserContentController *userContentController;


@end

static int i = 0;
@implementation WKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"WKWebView";
    [self initUI];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = NO;
}


/**
 初始化UI
 */
- (void)initUI
{
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    _userContentController = [[WKUserContentController alloc] init];
    [_userContentController addScriptMessageHandler:self name:@"btnClick"];
    [_userContentController addScriptMessageHandler:self name:@"calute"];
    config.userContentController = _userContentController;
    _webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds configuration:config];
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:LoadURL]]];
    _webView.allowsBackForwardNavigationGestures = YES;
    _webView.navigationDelegate = self;
    _webView.navigationDelegate = self;
    [self.view addSubview:_webView];
    
    //进度条
    UIView *progress = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 3)];
    progress.backgroundColor = [UIColor clearColor];
    [self.view addSubview:progress];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 0, 3);
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    [progress.layer addSublayer:layer];
    self.progresslayer = layer;

    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    self.navigationItem.leftBarButtonItem = barItem;
}

- (void)backAction:(UIButton *)btn
{
    if ([_webView canGoBack])
    {
        [_webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark--KVO监听
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progresslayer.opacity = 1;
        if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
            return;
        }
        self.progresslayer.frame = CGRectMake(0, 0, self.view.bounds.size.width * [change[@"new"] floatValue], 3);
        if ([change[@"new"] floatValue] == 1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progresslayer.opacity = 0;
            });
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progresslayer.frame = CGRectMake(0, 0, 0, 3);
            });
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark--WKUIDelegate


#pragma mark--WKNavigationDelegate


/**
 接到服务器跳转请求之后调用

 @param webView    webView
 @param navigation nav
 */
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation
{
    
}

/**
 *  在收到响应后，决定是否跳转
 *
 *  @param webView            实现该代理的webview
 *  @param navigationResponse 当前navigation
 *  @param decisionHandler    是否跳转block
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    
    NSLog(@"NaviResponse");
    if ([navigationResponse.response.URL.host.lowercaseString containsString:@"aoyou.com"]) {
        decisionHandler(WKNavigationResponsePolicyAllow);
//        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:LoadURL]]];
        return;
    }else if ([navigationResponse.response.URL.host.lowercaseString containsString:LocalHosts]){
        decisionHandler(WKNavigationResponsePolicyAllow);
        return;
    }else if ([navigationResponse.response.URL.host.lowercaseString containsString:@"baidu.com"]){
        decisionHandler(WKNavigationResponsePolicyAllow);
        return;
    }
    //其他域名一律不允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
}


/**
 在发送请求前，决定是否跳转

 @param webView          WKWebview
 @param navigationAction 当前的navigation
 @param decisionHandler  是否跳转
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    if ([navigationAction.request.URL.host.lowercaseString containsString:@"aoyou.com"]) {
        decisionHandler(WKNavigationActionPolicyAllow);
//        [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];

        return;
    }else if ([navigationAction.request.URL.host.lowercaseString containsString:LocalHosts]){
        decisionHandler(WKNavigationActionPolicyAllow);
        return;
    }else if ([navigationAction.request.URL.host.lowercaseString containsString:@"baidu.com"]){
        decisionHandler(WKNavigationActionPolicyAllow);
        return;
    }
    //其他域名一律不允许跳转
    decisionHandler(WKNavigationActionPolicyCancel);
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{

//    [_webView evaluateJavaScript:@"calValueCallBackToOC(200,100)" completionHandler:^(id _Nullable script, NSError * _Nullable error) {
//        NSLog(@"script is %@",script);
//    }];
}

//JS调用OC
#pragma mark--WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    if ([message.name isEqualToString:@"btnClick"])
    {
        i++;
        NSLog(@"******i=%d*****",i);
//        NSLog(@"message.body is %@",message.body);
        if ([message.body isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dic = message.body;
            NSLog(@"dic is %@",dic);
        }
    }else if ([message.name isEqualToString:@"calute"]){
        NSLog(@"message.body is %@",message.body);
    }
}

- (void)dealloc
{
    [(WKWebView *)self.view removeObserver:self forKeyPath:@"estimatedProgress"];
}

@end
