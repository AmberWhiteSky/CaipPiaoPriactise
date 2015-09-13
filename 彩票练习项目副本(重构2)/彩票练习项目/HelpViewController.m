//
//  HelpViewController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/13.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "HelpViewController.h"
#import "SettingArrowItem.h"
#import "GroupSetting.h"
#import "HtmlViewController.h"
#import "AmNavigationController.h"
#import "AmHelpHtml.h"

@interface HelpViewController ()
@property(nonatomic,strong) NSArray  *htmlArray;

@end

@implementation HelpViewController

//懒加载
- (NSArray *)htmlArray {
    if (_htmlArray==nil) {
        //json 文件路径
        NSString *path =[[NSBundle  mainBundle] pathForResource:@"product.json" ofType:nil];
        //加载json文件
        NSData *data=   [NSData  dataWithContentsOfFile:path];
        //将json 数据转化为nsarray 或者nsdictionary
        
        NSArray *dictArray =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        //        NSLog(@"%@",[dictArray[0] class]);
        
        //将字典转为模型
        NSMutableArray *htmlary =[NSMutableArray  array];
        for (NSDictionary*dict in  dictArray) {
            AmHelpHtml  *html=[AmHelpHtml  htmlWithDict:dict];
            [htmlary  addObject:html ];
        }
        _htmlArray =htmlary;
        
    }
    return  _htmlArray;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SettingItem *pushNotice =[SettingArrowItem  itemWithtitle:@"如何领奖?" destvcClass :nil];
    
    GroupSetting *group = [[GroupSetting  alloc] init];
    group.items =@[pushNotice];
    [self.data  addObject:group];

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HtmlViewController *html =[[HtmlViewController  alloc] init];
    AmNavigationController *nav  =[[AmNavigationController alloc] initWithRootViewController:html];
    [self  presentViewController:nav animated:YES completion:nil];
}

@end
