//
//  CustomCell.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/5.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "CustomCell.h"
#import "SettingItem.h"

@implementation CustomCell


//创建cell
+(instancetype)  cellWithTableView:(UITableView *) tableview{
    static NSString *ID =@"setting";
    CustomCell *cell = [tableview  dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}



-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
    }
    return self;
    
}

//设置模型  传递模型 赋值
-(void)setItem:(SettingItem *)item {
    _item=item;
    self.imageView.image =[UIImage imageNamed:item.icon];
    self.textLabel.text=item.title;
    

}
@end
