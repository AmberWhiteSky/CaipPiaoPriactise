//
//  HtmlViewController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/13.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "HtmlViewController.h"

@interface HtmlViewController ()

@end

@implementation HtmlViewController

//
-(void)loadView  {
    self.view =[[UIWebView  alloc] init];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webview =(UIWebView *) self.view;
    
    //创建url
    NSURL *url =[[NSBundle mainBundle] URLForResource:@"bjdc_howto.html" withExtension:nil];
    
    //创建请求
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    
    //发送请求请求加载网页
    [webview loadRequest:request];
    
    //设置左上角的关闭按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem  alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    
    
}

-(void)  close {
    [self  dismissViewControllerAnimated:YES completion:nil];
}
@end
