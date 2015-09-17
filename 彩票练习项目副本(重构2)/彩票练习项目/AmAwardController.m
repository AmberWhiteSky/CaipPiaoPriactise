//
//  AmAwArdController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/9.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "AmAwArdController.h"
#import "SettingSwitchItem.h"
#import "GroupSetting.h"

@interface AmAwArdController ()

@end

@implementation AmAwArdController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SettingItem *ball =[SettingSwitchItem  itemWithTitle:@"双色球" ];
    ball.switchkey  =@"AmAwArdController-ball";
    SettingItem *letou =[SettingSwitchItem  itemWithTitle:@"大乐透" ];
   
  
    GroupSetting *group = [[GroupSetting  alloc] init];
    group.items =@[ball,letou];
    
    group.header =@"打开设置即可在开奖后立即受到推送消息，获知开奖号码";
    [self.data  addObject:group];

}


@end
