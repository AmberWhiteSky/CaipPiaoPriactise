//
//  AllBugViewController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/8/31.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "AllBugViewController.h"

@interface AllBugViewController ()
- (IBAction)titleClick:(UIButton *)sender;

@end

@implementation AllBugViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


//头部按钮的监听
- (IBAction)titleClick:(UIButton *)sender {
    //1. 按钮旋转
    [UIView animateWithDuration:0.25 animations:^{
        sender.imageView. transform = CGAffineTransformMakeRotation(-M_PI);

    }];
    
    //添加一个uiview
    UIView *temp =[[UIView alloc]init];
    temp.frame= CGRectMake(10, 10, 100, 100);
    temp.backgroundColor =[UIColor  greenColor];
    [self.view addSubview:temp];
}
@end
