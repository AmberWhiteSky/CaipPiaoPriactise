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
#import <MessageUI/MessageUI.h>

@interface ShareViewController ()<MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SettingItem *sinashare =[SettingArrowItem  itemWithIcon:@"MailShare" title:@"新浪微博" destvcClass:nil];
    SettingItem *messageshare =[SettingArrowItem  itemWithIcon:@"MailShare" title:@"短信分享"  destvcClass:nil];
    messageshare.option =^{
        //短信分享
        //        NSURL *url =[NSURL URLWithString:@"sms://13761265573"];
        //        [[UIApplication  sharedApplication]openURL:url];
        MFMessageComposeViewController *vc = [[MFMessageComposeViewController  alloc] init];
        //设置短信内容
        vc.body =@"该睡觉了";
        //设置收件人列表
        vc.recipients =@[@"13761423573"];
        //设置代理
        vc.messageComposeDelegate =self;
        //显示控制器
        [self presentViewController:vc animated:YES completion:nil];
        
        //显示短信内容
    };
    SettingItem *mainshare =[SettingArrowItem  itemWithIcon:@"MailShare" title:@"邮件分享"  destvcClass:nil];
    
    mainshare.option =^{
//        NSURL *url = [NSURL  URLWithString:@"mailto//3131265@qq.com"];
//        [[UIApplication  sharedApplication ]openURL:url];
        
        MFMailComposeViewController  *VC =[[MFMailComposeViewController  alloc] init];
        //设置邮件主题
        [VC  setSubject:@"会议"];
        //设置邮件内容
        [VC setMessageBody:@"晚上约不约" isHTML:NO];
        //设置收件人列表
        [VC setToRecipients:@[@"3423422965@qq.com"]];
        //设置抄送人列表
        [VC setCcRecipients:@[@"324234601@qq.com"]];
        //设置密送人列表
        [VC setBccRecipients:@[@"242342@qq.com"]];
        //添加附件
        UIImage *image =[UIImage  imageNamed:@"lufy.jpeg"];
//        NSData  *data =UIImageJPEGRepresentation(image, 0.5);
        //压缩png
        NSData *data =UIImagePNGRepresentation(image);
        [VC  addAttachmentData:data mimeType:@"image/png" fileName:@"lufy.png"];
        //设置代理
        VC.mailComposeDelegate=self;
        //显示控制器
        [self presentViewController:VC animated:YES completion:nil];
        
        
    };
    GroupSetting *group = [[GroupSetting  alloc] init];
    group.items =@[sinashare,messageshare,mainshare];
    [self.data  addObject:group];
    
    
}

/** 
 点击取消按钮会自动调用
 **/
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result  {
    [controller  dismissViewControllerAnimated:YES completion:nil];

}

/**
 点击取消按钮会自动调用
 **/
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [controller  dismissViewControllerAnimated:YES completion:nil];
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
