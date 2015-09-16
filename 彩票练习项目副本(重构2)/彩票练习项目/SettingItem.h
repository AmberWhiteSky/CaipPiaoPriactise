//
//  SettingItem.h
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/4.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//  每一个cell 都对应SettingItem一个模型

#import <Foundation/Foundation.h>

//枚举
//typedef enum {
//    SettingItemTypeArrow,
//    SettingItemTypeSwitch
//    
//}SettingItemType;

typedef  void (^SettingItemOption)();



@interface SettingItem : NSObject

// 图标
@property(nonatomic,copy)  NSString *icon;
//标题
@property(nonatomic,copy)  NSString *title;

//子标题
@property(nonatomic,copy) NSString*subtitle;

//点击那个cell 需要做什么事情
@property(nonatomic,copy) SettingItemOption  option;



//不用跳转的方法
+(instancetype) itemWithIcon:(NSString *) icon  title:(NSString *)title ;

+(instancetype) itemWithTitle:(NSString *) title ;
@end
