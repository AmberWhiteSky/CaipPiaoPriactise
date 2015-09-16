//
//  AmSettingController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/4.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "AmSettingController.h"
#import "SettingArrowItem.h"
#import "SettingSwitchItem.h"
#import "GroupSetting.h"
#import "MBProgressHUD+MJ.h"
#import "AmPushController.h"
#import "Test1Controller.h"
#import "Test2Controller.h"
#import "AmGridController.h"
#import "AmBaseSettingController.h"
#import "HelpViewController.h"
#import "ShareViewController.h"
#import "CaiPiaoViewController.h"
@interface AmSettingController ()


@end

@implementation AmSettingController




//第零组的数据
-(void) setupZeroGroup{
    SettingItem *pushNotice =[SettingArrowItem  itemWithIcon:@"MorePush" title:@"推送和提醒" destvcClass:[AmPushController class]];
    SettingItem *handShake =[SettingSwitchItem  itemWithIcon:@"handShake" title:@"摇一摇机选" ];
    SettingItem *sound_Effect =[SettingSwitchItem  itemWithIcon:@"sound_Effect" title:@"声音效果"];
    
    GroupSetting *group = [[GroupSetting  alloc] init];
    //把内容添加到组模型中
    group.items =@[pushNotice,handShake,sound_Effect];
    [self.data  addObject:group];
    
};


//第一组的数据
-(void) setupOneGroup{
    //1组
    SettingItem *MoreUpdate =[SettingItem  itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    MoreUpdate.option =^{
        NSLog(@"检查新版本");
        [MBProgressHUD  showMessage:@"正在检查中"];
#warning 发送网络请求去检查有没有最新版本
        //几秒钟后消失
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //移除hub
            [MBProgressHUD  hideHUD  ];
            
            //提醒没有新版本
            [MBProgressHUD  showError:@"没有新版本"];
            
        });
    };
    
    SettingItem *help =[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"帮助" destvcClass:[HelpViewController class]];
    SettingItem *share =[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"分享" destvcClass:[ShareViewController class]];
    SettingItem *look=[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"查看消息" destvcClass:[Test1Controller class]];
    SettingItem *product =[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"产品推荐" destvcClass:[AmGridController class]];
    SettingItem *about =[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"关于" destvcClass:[CaiPiaoViewController class]];
    
    //        help.option =^{
    //            NSLog(@"帮助");
    //        };
    GroupSetting *group = [[GroupSetting  alloc] init];
    //把内容添加到组模型中
    group.items =@[MoreUpdate,help,share,look,product,about];
    [self.data  addObject:group];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.标题
    self.title=@"设置";
    //2.添加数据
    [self setupZeroGroup];
    [self setupOneGroup];
    
}


@end
