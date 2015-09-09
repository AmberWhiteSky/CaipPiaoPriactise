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
    
    SettingItem *pushNotice =[SettingSwitchItem  itemWithIcon:nil title:@"开奖号码推送" ];
    SettingItem *pushNotice1 =[SettingSwitchItem  itemWithIcon:nil title:@"中奖动画" ];
   
  
    GroupSetting *group = [[GroupSetting  alloc] init];
    group.items =@[pushNotice,pushNotice1];
    group.header =@"daletou";
    group.items = @"dadasdasda";
    [self.data  addObject:group];

}


@end
