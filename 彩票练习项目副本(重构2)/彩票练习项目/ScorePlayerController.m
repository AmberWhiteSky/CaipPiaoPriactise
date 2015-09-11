//
//  ScorePlayerController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/11.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "ScorePlayerController.h"
#import "SettingSwitchItem.h"
#import "GroupSetting.h"
#import "Test1Controller.h"

@interface ScorePlayerController ()

@end

@implementation ScorePlayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  setupZeroGroup];
}


//第零组的数据
-(void) setupZeroGroup{
    SettingItem *noticePlayer =[SettingSwitchItem  itemWithIcon:nil title:@"提醒我关注的比赛" ];
    
    
    
    GroupSetting *group = [[GroupSetting  alloc] init];
    group.items =@[noticePlayer];
    
    [self.data  addObject:group];
    
};


//第一组的数据
//-(void) setupOneGroup{
//    //1组
//    SettingItem *MoreUpdate =[SettingItem  itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
//    MoreUpdate.option =^{
//        NSLog(@"检查新版本");
//        [MBProgressHUD  showMessage:@"正在检查中"];
//#warning 发送网络请求去检查有没有最新版本
//        //几秒钟后消失
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            //移除hub
//            [MBProgressHUD  hideHUD  ];
//            
//            //提醒没有新版本
//            [MBProgressHUD  showError:@"没有新版本"];
//            
//        });
//    };
//    
//    //设置内容
//    SettingItem *help =[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"帮助" destvcClass:[Test1Controller class]];
//    SettingItem *share =[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"分享" destvcClass:[Test1Controller class]];
//    SettingItem *look=[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"查看消息" destvcClass:[Test1Controller class]];
//    SettingItem *product =[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"产品推荐" destvcClass:[AmGridController class]];
//    SettingItem *about =[SettingArrowItem  itemWithIcon:@"MoreHelp" title:@"关于" destvcClass:[Test1Controller class]];
//    
//    //        help.option =^{
//    //            NSLog(@"帮助");
//    //        };
//    GroupSetting *group = [[GroupSetting  alloc] init];
//    group.items =@[MoreUpdate,help,share,look,product,about];
//    [self.data  addObject:group];
//}



@end
