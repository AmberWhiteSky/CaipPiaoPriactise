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
#import "Test1Controller.h"
#import "Test2Controller.h"
#import "MBProgressHUD+MJ.h"
#import "AmGridController.h"
#import "AmPushController.h"
#import "AmAwArdController.h"
#import "AnimationController.h"
#import "BuyMoneyController.h"
#import "ScorePlayerController.h"
@interface AmPushController ()


@end

@implementation AmPushController


//第零组的数据
-(void) setupZeroGroup{
    SettingItem *pushNotice =[SettingArrowItem  itemWithtitle:@"开奖号码推送" destvcClass:[AmAwArdController class]];
      SettingItem *pushNotice1 =[SettingArrowItem  itemWithtitle:@"中奖动画" destvcClass:[AnimationController class]];
      SettingItem *pushNotice2 =[SettingArrowItem  itemWithtitle:@"比分直播提醒" destvcClass:[ScorePlayerController class]];
      SettingItem *pushNotice3 =[SettingArrowItem   itemWithtitle:@"购彩定时提醒" destvcClass:[BuyMoneyController class]];
    
    GroupSetting *group = [[GroupSetting  alloc] init];
    group.items =@[pushNotice,pushNotice1,pushNotice2,pushNotice3];
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
    
    //设置内容
    SettingItem *help =[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"帮助" destvcClass:[Test1Controller class]];
    SettingItem *share =[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"分享" destvcClass:[Test1Controller class]];
    SettingItem *look=[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"查看消息" destvcClass:[Test1Controller class]];
    SettingItem *product =[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"产品推荐" destvcClass:[AmGridController class]];
    SettingItem *about =[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"关于" destvcClass:[Test1Controller class]];
    
    //        help.option =^{
    //            NSLog(@"帮助");
    //        };
    GroupSetting *group = [[GroupSetting  alloc] init];
    group.items =@[MoreUpdate,help,share,look,product,about];
    [self.data  addObject:group];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self  setupZeroGroup];
}


@end
