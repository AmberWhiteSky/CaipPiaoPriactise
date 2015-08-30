//
//  AmTabBarController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/8/29.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "AmTabBarController.h"
#import "AmTabBar.h"
#import "AmTabBarButton.h"




@interface AmTabBarController () <AmTabBarDelegate>
@end

@implementation AmTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //1.添加tabbar之前先把系统的移除
    [self.tabBar removeFromSuperview];
    //2 添加自己的tabbar
    AmTabBar *amtabbar = [[AmTabBar alloc]init];
    amtabbar.delegate=self;
    amtabbar.frame =self.tabBar.frame;
    amtabbar.backgroundColor = [UIColor  grayColor];
    [self.view addSubview: amtabbar];
    
    NSLog(@"AmTabBarController");
    
    
    
    
}

#pragma  mark  AmTabBar的代理方法
-(void)tabbar:(AmTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to {

    NSLog(@"----%d----%d",from,to);
    //选中最新的控制器
    self.selectedIndex=to;
}








@end
