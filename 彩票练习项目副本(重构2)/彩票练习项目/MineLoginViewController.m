//
//  MineLoginViewController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/2.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "MineLoginViewController.h"
#import "UIImage+Extension.h"

@interface MineLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginClick;

@end

@implementation MineLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //
    UIImage *normalimage =[UIImage  resizeableImage:@"RedButton"];
    UIImage *pressimage= [UIImage  resizeableImage:@"RedButtonPressed"];
    
    //设置图片的三种方法
    
    //    [normalimage  stretchableImageWithLeftCapWidth:normalimage.size.width*0.5 topCapHeight:normalimage.size.height*0.5];
    //        [pressimage  stretchableImageWithLeftCapWidth:normalimage.size.width*0.5 topCapHeight:normalimage.size.height*0.5];
    
    
    //    [normalimage  resizableImageWithCapInsets:UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)];
    //    [normalimage  resizableImageWithCapInsets:<#(UIEdgeInsets)#> resizingMode:<#(UIImageResizingMode)#>];
    [self.loginClick setBackgroundImage:normalimage forState:UIControlStateNormal];
    [self.loginClick setBackgroundImage:pressimage forState:UIControlStateHighlighted];
    
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
