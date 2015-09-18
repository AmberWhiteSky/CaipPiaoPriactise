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
        //添加switch事件
        [_switchView  addTarget:self action:@selector(switchStateChange) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}

//重写init 方法

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  {
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        
        
        //初始化操作
        //设置普通的背景‘
        //        UIView *bg =[[UIView  alloc]init];
        //        bg.backgroundColor =[UIColor  whiteColor];
        //        self.backgroundView =bg;
        //
        //
        //
        
        
        [self setUpBg];
        //初始化子控件
        [self  setupSubViews];
    }
    return self;
    
}

-(void)   setupSubViews{
    self.textLabel.backgroundColor =[UIColor clearColor];
    self.detailTextLabel.backgroundColor =[UIColor clearColor];
    
}

//初始化背景
-(void) setUpBg {
    //设置普通的背景‘
    UIView *bg =[[UIView  alloc]init];
    bg.backgroundColor =[UIColor  whiteColor];
    self.backgroundView =bg;
    //        //设置选中时的背景‘
    UIView *selectbg =[[UIView  alloc]init];
    selectbg.backgroundColor =[UIColor  redColor];
    self.selectedBackgroundView=selectbg;
    
    
    
}

//监听UISwitch 状态改变的方法
-(void) switchStateChange{
    NSLog(@"witchView ---%d",self.switchView.isOn);
    
    //保存选择的状态
    NSUserDefaults * defaults = [NSUserDefaults  standardUserDefaults];
    //先判断 在保存
    if (self.item.switchkey) {
        [defaults  setBool:self.switchView.isOn forKey:self.item.switchkey];
        [defaults synchronize];
        
    }
    
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
        //改变cell的样式  会影响cell的子标题显示的位置
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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
    
    self.textLabel.text =self.item.title;
    //设置子标题
    self.detailTextLabel.text =self.item.subtitle;
    
    
}

//设置数据
-(void)  setupData{
    if (self.item.icon) {
        self.imageView.image =[UIImage imageNamed:self.item.icon];
        self.textLabel.text=self.item.title;
        
    }
    
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
        
        //（读取之前保存的开发状态）设置开关状态
        NSUserDefaults *defaults = [NSUserDefaults  standardUserDefaults];
        
        //先判断有没有值，再读取
        if (self.item.switchkey) {
            self.switchView.on = [defaults  boolForKey:self.item.switchkey];
            
        }
        
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
