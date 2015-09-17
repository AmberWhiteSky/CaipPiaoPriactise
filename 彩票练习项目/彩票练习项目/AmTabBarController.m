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
@interface AmTabBarController ()
//用来记录当前选中的按钮
@property(nonatomic,weak) UIButton *selectedButton;
@end

@implementation AmTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //1.添加tabbar之前先把系统的移除
    [self.tabBar removeFromSuperview];
    //2 添加自己的tabbar
    AmTabBar *amtabbar = [[AmTabBar alloc]init];
    amtabbar.frame =self.tabBar.frame;
    amtabbar.backgroundColor = [UIColor  grayColor];
    [self.view addSubview: amtabbar];
    
    //3.添加五个按钮
    
    for (int  i=0; i<5; i++) {
        //创建按钮
        AmTabBarButton *button  =[AmTabBarButton  buttonWithType:UIButtonTypeCustom];
        //给按钮设置索引
        button.tag=i;
        //设置图片
        NSString *name = [NSString stringWithFormat:@"TabBar%d",i+1];
        
        [button  setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        //设置选中图片
        NSString *selectedName =[NSString stringWithFormat:@"TabBar%dSel",i+1];
        [button  setBackgroundImage:[UIImage imageNamed:selectedName] forState:UIControlStateSelected];
        
        
        
        
        //设置frame
        CGFloat buttonY =0;
        CGFloat butonW =amtabbar.frame.size.width*0.2;
        CGFloat buttonH =amtabbar.frame.size.height;
        CGFloat buttonX = i*butonW;
        button.frame =CGRectMake(buttonX, buttonY, butonW, buttonH);
        
        // 添加
        [amtabbar addSubview:button];
        
        //监听
#warning UIControlEventTouchDown  手指一按下去就触发这个事件
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        
        //默认选中第一项
        if (i==0) {
            [self  buttonClick:button];
        }
    }
    
    NSLog(@"AmTabBarController");
    
    
    
    
}

//按钮状态  normal  普通  ／ highlighted 高亮  disable:enabled ＝no  /selected  选中  selected=yes

//按钮点击监听方法
-(void)buttonClick: (UIButton  *)button{
    
    //1.让当前选中按钮取消选中
    self.selectedButton.selected=NO;
    //2. 让新点击的按钮选中
    button.selected=YES;
    //3.新点击的按钮就成为当前选中
    self.selectedButton=button;
    
    //4.切换子控制器
    self.selectedIndex=button.tag;
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
