//
//  BuyMoneyController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/11.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "BuyMoneyController.h"
#import "SettingSwitchItem.h"
#import "GroupSetting.h"

@interface BuyMoneyController ()

@end

@implementation BuyMoneyController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SettingItem *butmoney =[SettingSwitchItem  itemWithIcon:nil title:@"购彩定时提醒" ];
    
    
    
    GroupSetting *group = [[GroupSetting  alloc] init];
    group.items =@[butmoney];
    
    group.header =@"购彩定时提醒";
    [self.data  addObject:group];
    
}


@end