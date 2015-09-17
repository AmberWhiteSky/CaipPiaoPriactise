//
//  CaiPiaoViewController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/16.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "CaiPiaoViewController.h"
#import "GroupSetting.h"
#import "SettingArrowItem.h"
@interface CaiPiaoViewController ()
//声明变量
//@property(nonatomic ,strong) UIWebView  *webView;

@end

@implementation CaiPiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *webView =[[UIWebView  alloc]  init];
    webView.frame =CGRectZero;
    [self.view addSubview:webView];
    
    
    //1.具体数据
    SettingItem *mark =[SettingArrowItem  itemWithtitle:@"评分支持" destvcClass:nil];
    SettingItem *call =[SettingArrowItem  itemWithtitle:@"客户电话" destvcClass:nil];
    call.subtitle =@"137612315573";
    call.option =^{
        NSURL *url =[NSURL URLWithString:@"tel://13731231573"];
        //        [[UIApplication  sharedApplication] openURL:url];
        
        //有提示对话框的打电话的方式  私有api
        //        NSURL *url =[NSURL URLWithString:@"telprompt://13761265573"];
        //        [[UIApplication  sharedApplication ] openURL:url];
        
        //能有提示对话框 也能回到程序中
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
    };
    GroupSetting *group = [[GroupSetting  alloc] init];
    group.items =@[mark,call];
    [self.data  addObject:group];
    
    //2.header
    self.tableView.tableHeaderView =[UIButton  buttonWithType:UIButtonTypeContactAdd];
}

@end
