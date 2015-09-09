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
#import "CustomCell.h"
#import "MBProgressHUD+MJ.h"
#import "AmGridController.h"
@interface AmSettingController ()

@property(nonatomic,strong) NSMutableArray *data;

@end

@implementation AmSettingController


-(id)init {
    return  [super  initWithStyle:UITableViewStyleGrouped];
    
}

-(id)initWithStyle:(UITableViewStyle)style {
    return [super  initWithStyle:UITableViewStyleGrouped];
    
}


//第零组的数据
-(void) setupZeroGroup{
    SettingItem *pushNotice =[SettingArrowItem  itemWithIcon:@"MorePush" title:@"推送和提醒" destvcClass:[Test1Controller class]];
    SettingItem *handShake =[SettingSwitchItem  itemWithIcon:@"handShake" title:@"摇一摇机选" ];
    SettingItem *sound_Effect =[SettingSwitchItem  itemWithIcon:@"sound_Effect" title:@"声音效果"];
    
    GroupSetting *group = [[GroupSetting  alloc] init];
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


- (NSMutableArray *)data {
    if (_data==nil) {
        _data =[NSMutableArray  array];
        
        //0组数据
        [self  setupZeroGroup];
        
        //1组数据
        [self  setupOneGroup];
        
    }
    return  _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    //1.标题
    self.title=@"设置";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //    NSArray  *subdata = self.data[section];
    //    return  subdata.count;
    
    GroupSetting  *group =self.data[section];
    return  group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    //1.创建cell
    CustomCell *cell =[CustomCell  cellWithTableView:tableView];
    
    //2.给cell传递模型数据
    GroupSetting * group = self.data[indexPath.section];
    //    SettingItem *item = group.items[indexPath.row];
    cell.item =group.items[indexPath.row];
    //3返回cell
    return cell;
    
    
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //取消选中这行
    [tableView  deselectRowAtIndexPath:indexPath animated:YES];
    
    //模型数据
    GroupSetting * group = self.data[indexPath.section];
    SettingItem *item = group.items[indexPath.row];
    
    if (item.option) {//block 有值（点击这个cell 有特定的操作需要执行）
        item.option();
    }else if ([item isKindOfClass:[SettingArrowItem  class]]) {//箭头
        SettingArrowItem * arrowitem = (SettingArrowItem *)item;
        if (arrowitem.destvcClass ==nil)
            //如果没有需要跳转的控制器 直接返回
            return;
        
        
        UIViewController *vc =[[arrowitem.destvcClass alloc] init];
        //设置控制器标题
        vc.title  =arrowitem.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

//tableview的 header

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    GroupSetting *group =self.data[section];
    return  group.header;
}
//tableview的 footer
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    GroupSetting *group =self.data[section];
    return  group.footer;
    
}



@end
