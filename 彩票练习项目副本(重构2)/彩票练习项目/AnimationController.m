//
//  AnimationController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/11.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "AnimationController.h"
#import "SettingSwitchItem.h"
#import "GroupSetting.h"

@interface AnimationController ()

@end

@implementation AnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SettingItem *pushNotice =[SettingSwitchItem  itemWithIcon:nil title:@"中奖动画" ];
    
    
    
    GroupSetting *group = [[GroupSetting  alloc] init];
    group.items =@[pushNotice];
    
    group.header =@"中奖动画";
    [self.data  addObject:group];
    
}


@end
