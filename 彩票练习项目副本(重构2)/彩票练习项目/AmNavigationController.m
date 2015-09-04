//
//  AmNavigationController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/8/30.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "AmNavigationController.h"

@interface AmNavigationController ()

@end

@implementation AmNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
}

//系统在第一次使用这个类的时候调用 （1个类只会调用一次）
+(void)initialize {
    //3.设置导航栏的主题
    UINavigationBar  * Navbar =  [UINavigationBar appearance];
    //iOS6设置整个item的颜色 iOS7设置文字颜色（导航栏的返回键）
    
    //设置背景图片 考拉iOS系统
    if ([[UIDevice  currentDevice].systemVersion doubleValue]>=7.0) {
        //7.0
        [Navbar setBackgroundImage:[UIImage  imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        Navbar.tintColor =[UIColor  whiteColor];

    }else{
        //7.0以下
        [Navbar setBackgroundImage:[UIImage  imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];
    }
    
    
    
    //4. 设置标题文字颜色
    NSMutableDictionary *attrs =[NSMutableDictionary  dictionary];
    //设置字体颜色
    attrs[UITextAttributeTextColor] =[UIColor whiteColor];
    //设置字体大小
    attrs[UITextAttributeFont] =[UIFont  systemFontOfSize:20];
    [Navbar setTitleTextAttributes:attrs];
    
    //设置barbuttonitem主题
    UIBarButtonItem *item =[UIBarButtonItem  appearance];
    NSMutableDictionary *itemattrs =[NSMutableDictionary  dictionary];
    
    //设置字体颜色
    itemattrs[UITextAttributeTextColor] =[UIColor whiteColor];
    //设置字体大小
    attrs[UITextAttributeFont] =[UIFont  systemFontOfSize:14];
    
    //设置文字颜色
    [item setTitleTextAttributes:itemattrs forState:UIControlStateNormal];
    
    
    if (![[UIDevice  currentDevice].systemVersion doubleValue]>=7.0) {
        //设置按钮背景
        [item setBackgroundImage:[UIImage  imageNamed:@"NavButton"] forState:UIControlStateNormal  barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage  imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        //设置返回按钮
        [item setBackButtonBackgroundImage:[UIImage  imageNamed:@"NavBackButton"] forState:UIControlStateNormal  barMetrics:UIBarMetricsDefault];
        [item setBackButtonBackgroundImage:[UIImage  imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted  barMetrics:UIBarMetricsDefault];
    }
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 重写这个方法 拦截所有push 的操作
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    
    NSLog(@"-----%@",viewController);
    //隐藏地步导航栏
    viewController.hidesBottomBarWhenPushed=YES;
    [super pushViewController:viewController animated:NO];
}

//-(NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    return  [super popToViewController:viewController animated:NO];
//}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
