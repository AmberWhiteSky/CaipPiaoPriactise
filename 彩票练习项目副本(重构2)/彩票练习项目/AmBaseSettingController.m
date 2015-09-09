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
#import "CustomCell.h"
@interface AmBaseSettingController ()


@end

@implementation AmBaseSettingController


-(id)init {
    return  [super  initWithStyle:UITableViewStyleGrouped];
    
}

-(id)initWithStyle:(UITableViewStyle)style {
    return [super  initWithStyle:UITableViewStyleGrouped];
    
}
//懒加载
- (NSMutableArray *)data {
    if (_data==nil) {
        _data =[NSMutableArray  array];
    }
    return  _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
