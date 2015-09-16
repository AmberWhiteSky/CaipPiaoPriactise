//
//  CaiPiaoViewController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/16.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "CaiPiaoViewController.h"
#import "GroupSetting.h"
#import "SettingArrowItem.h"
@interface CaiPiaoViewController ()

@end

@implementation CaiPiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.具体数据
    SettingItem *mark =[SettingArrowItem  itemWithtitle:@"评分支持" destvcClass:nil];
    SettingItem *call =[SettingArrowItem  itemWithtitle:@"客户电话" destvcClass:nil];
    call.subtitle =@"10000";
    GroupSetting *group = [[GroupSetting  alloc] init];
    group.items =@[mark,call];
    [self.data  addObject:group];
    
    //2.header
    self.tableView.tableHeaderView =[UIButton  buttonWithType:UIButtonTypeContactAdd];
}

@end
