//
//  SettingItem.h
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/4.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//  每一个cell 都对应SettingItem一个模型

#import <Foundation/Foundation.h>

@interface SettingItem : NSObject

// 图标
@property(nonatomic,copy)  NSString *icon;
//标题
@property(nonatomic,copy)  NSString *title;

//点击这行cell 需要跳转控制器
@property(nonatomic,assign)  Class  destvcClass;


+(instancetype) itemWithIcon:(NSString *) icon  title:(NSString *)title  destvcClass:(Class) destvcClass;


@end
