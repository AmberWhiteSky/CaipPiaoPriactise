//
//  CustomCell.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/5.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "CustomCell.h"
#import "SettingItem.h"
#import "SettingSwitchItem.h"
#import "SettingArrowItem.h"
#import "LableItem.h"

@interface CustomCell ()
/** 箭头 **/
@property(nonatomic,strong) UIImageView *arrowView;
/** 开关**/
@property(nonatomic,strong) UISwitch  *switchView ;
/** 标签**/
@property(nonatomic,strong) UILabel  *rightlable ;

@end

@implementation CustomCell

//箭头懒加载
- (UIImageView *)arrowView {
    if (_arrowView==nil) {
        _arrowView =[[UIImageView alloc] initWithImage:[UIImage  imageNamed:@"CellArrow"]];
    }
    return  _arrowView;

}
//开关懒加载
-(UISwitch *)switchView {
    if (_switchView==nil) {
        _switchView =[[UISwitch  alloc] init];
    }
    return _switchView;
}

//标签懒加载
-(UILabel *)rightlable {
    if (_rightlable==nil) {
        _rightlable = [[UILabel  alloc] init];
        _rightlable.bounds =CGRectMake(0, 0, 100, 30);
        _rightlable.backgroundColor =[UIColor  redColor];
        
    }
    
    return _rightlable;

}
//创建cell
+(instancetype)  cellWithTableView:(UITableView *) tableview{
    static NSString *ID =@"setting";
    CustomCell *cell = [tableview  dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}


//
//-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        //
//    }
//    return self;
//    
//}

//设置模型  传递模型 赋值
-(void)setItem:(SettingItem *)item {
    _item=item;
    
    
    //1.设置数据
    [self setupData];
    
    //2.设置右边数据
    [self  setupRightContent];
}

//设置数据
-(void)  setupData{
    if (self.item.icon) {
        self.imageView.image =[UIImage imageNamed:self.item.icon];
        self.textLabel.text=self.item.title;

    }
    self.textLabel.text =self.item.title;
    
}

//设置右边内容
-(void) setupRightContent {
    if ([self.item isKindOfClass:[SettingArrowItem class]]) {
        //箭头
        self.accessoryView = self.arrowView;
    }else  if([self.item  isKindOfClass:[SettingSwitchItem class]]){
        //开关
        self.accessoryView =self.switchView;
        //当是开关的时候判断  点击没有样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    else  if([self.item  isKindOfClass:[LableItem class]]){
        //标签
        self.accessoryView =self.rightlable;
        //当是开关的时候判断  点击没有样式
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    else {
        //什么也没有显示
        self.accessoryView =nil;
    }
}
@end
