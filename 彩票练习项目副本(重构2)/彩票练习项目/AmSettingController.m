//
//  AmSettingController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/4.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "AmSettingController.h"
#import "SettingItem.h"
#import "AmPushNoticeController.h"

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

- (NSMutableArray *)data {
    if (_data==nil) {
        _data =[NSMutableArray  array];
        //0组
        SettingItem *item00 = [SettingItem  itemWithIcon:@"MorePush" title:@"推送和提醒" vcClass:[AmPushNoticeController class]];
         SettingItem *item01 = [SettingItem  itemWithIcon:@"handShake" title:@"推送和提醒22" vcClass:[AmPushNoticeController class]];
        NSArray  *array0 =@[item00,item01];
        
        
        
        //1 组
         SettingItem *item10 = [SettingItem  itemWithIcon:@"IDInfo" title:@"推送和提醒333" vcClass:[AmPushNoticeController class]];
        NSArray  *array1 =@[item10];

        [_data addObject:array0];
        [_data addObject:array1];

        
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
    NSArray  *subdata = self.data[section];
    return  subdata.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    //创建cell
    static NSString *ID =@"setting";
    UITableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    //2.设置cell数据
    SettingItem  *item =self.data [indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage  imageNamed:item.icon];
    cell.textLabel.text =item.title;
    
    
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    SettingItem  *item = self.data[indexPath.section][indexPath.row];
    UIViewController  *vc  =[[item.vcClass  alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
