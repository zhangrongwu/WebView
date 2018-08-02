//
//  ViewController.m
//  WebView
//
//  Created by zhangrongwu on 2018/8/2.
//  Copyright © 2018年 ENN. All rights reserved.
//

#import "ViewController.h"
#import "JSObjectManager.h"

@interface ViewController () <UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://zhangrongwu.github.io/vueDemo/dist/"]]];
    [self registerObjectToJS];
}
- (void)registerObjectToJS {
    //    获取html的window对象
    JSContext *jsContext = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    // 原生界面实现方法的对象
    JSObjectManager *object = [[JSObjectManager alloc] init];
    //    把对象塞给JSContext的app对象，js端使用app开头调用 如 app.test() 、 app.testFunction()
    jsContext[@"vueProject"] = object;
}
// webview 代理
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"网页的标题是 ： %@", [webView stringByEvaluatingJavaScriptFromString:@"document.title"]);
    [self registerObjectToJS]; // 他们说这也需要写一个，不知道是不是需要写。测试时不写也没问题
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"加载失败");
}

@end
