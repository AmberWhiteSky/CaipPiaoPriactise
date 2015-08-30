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
    //设置背景图片 考拉iOS系统
    if ([[UIDevice  currentDevice].systemVersion doubleValue]>=7.0) {
        //7.0
        [Navbar setBackgroundImage:[UIImage  imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



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
