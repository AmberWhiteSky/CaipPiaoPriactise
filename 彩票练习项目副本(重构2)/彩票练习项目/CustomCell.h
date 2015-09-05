//
//  CustomCell.h
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/5.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  SettingItem;  //绑定item
@interface CustomCell : UITableViewCell
@property(nonatomic,strong) SettingItem *item;



@property(nonatomic,copy)NSString *myname;



+(instancetype)  cellWithTableView:(UITableView *) tableview;
@end
