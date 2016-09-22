//
//  AYWKWebView.m
//  WKVSUIWebView
//
//  Created by kong on 16/9/21.
//  Copyright © 2016年 konglee. All rights reserved.
//

#import "AYWKWebView.h"
#import <objc/runtime.h>
#import "LocalDocumentEct.h"

static const char *HYBRIDBRIDGE = "HYBRIDBRIDGE";


@interface AYWKWebView()

@property (nonatomic, weak) CALayer *progresslayer;

@end

@implementation AYWKWebView


#pragma mark--SET
- (void)setBridge:(AYHybridBridge *)bridge
{
    objc_setAssociatedObject(self, HYBRIDBRIDGE, bridge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark--GET
- (AYHybridBridge *)bridge
{
    return objc_getAssociatedObject(self, HYBRIDBRIDGE);
}

//初始化浏览器
- (instancetype)initWithFrame:(CGRect)frame configuration:(nonnull WKWebViewConfiguration *)configuration
{
    self = [super initWithFrame:frame configuration:configuration];
    if (self)
    {
        //初始化进度条
        [self initProgressView];
        
        //添加KVO观察者
        [self addKVOOserver];
        
        //绑定bridge
        self.bridge = [AYHybridBridge shareInstanceWith:self];
        
    }
    return self;
}

//初始化进度条
- (void)initProgressView
{
    //进度条
    UIView *progress = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 3)];
    progress.backgroundColor = [UIColor clearColor];
    [self addSubview:progress];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 0, 3);
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    [progress.layer addSublayer:layer];
    self.progresslayer = layer;
}

//加载HTML 如果本地没有HTML则加载线上的URL
- (void)loadLocalHtml:(NSString *)urlString
{
    [LocalDocumentEct loadLocalHtmlString:[NSURL URLWithString:_requestURL]];
}


//注入Config
- (void)setUpConfig:(NSArray *)configStrings
{
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *uContentController = [[WKUserContentController alloc] init];
    //addScript
    for (NSString *str in configStrings)
    {
        [uContentController addScriptMessageHandler:self name:str];
    }
    config.userContentController = uContentController;
    
}

//添加KVO监听
- (void)addKVOOserver
{
    [self addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark--KVO监听
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progresslayer.opacity = 1;
        if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
            return;
        }
        self.progresslayer.frame = CGRectMake(0, 0, self.bounds.size.width * [change[@"new"] floatValue], 3);
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


//收到JS Message之后执行的跳转
#pragma mark-WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    //跳转使用代理进行跳转 
    if ([self.jsActionDelegate respondsToSelector:@selector(jsActionOC:)]) {
        [self.jsActionDelegate jsActionOC:message];
    }
}







@end
