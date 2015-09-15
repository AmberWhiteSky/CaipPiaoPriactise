//
//  ShareViewController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/15.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "ShareViewController.h"
#import "SettingArrowItem.h"
#import "GroupSetting.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SettingItem *sinashare =[SettingArrowItem  itemWithIcon:@"MailShare" title:@"新浪微博" destvcClass:nil];
    SettingItem *messageshare =[SettingArrowItem  itemWithIcon:@"MailShare" title:@"短信分享"  destvcClass:nil];
    messageshare.option =^{
        
    };
    SettingItem *mainshare =[SettingArrowItem  itemWithIcon:@"MailShare" title:@"邮件分享"  destvcClass:nil];
   
    GroupSetting *group = [[GroupSetting  alloc] init];
    group.items =@[sinashare,messageshare,mainshare];
    [self.data  addObject:group];
    
    
}

//第零组的数据
//-(void) setupZeroGroup{
//    SettingItem *sinashare =[SettingArrowItem  itemWithIcon:@"MailShare" title:@"新浪微博" destvcClass:nil];
//    SettingItem *messageshare =[SettingArrowItem  itemWithIcon:@"MailShare" title:@"短信分享"  destvcClass:nil];
//    SettingItem *mainshare =[SettingArrowItem  itemWithIcon:@"MailShare" title:@"邮件分享"  destvcClass:nil];
//    GroupSetting *group = [[GroupSetting  alloc] init];
//    group.items =@[sinashare,messageshare,mainshare];
//    [self.data  addObject:group];
//    
//};


@end
