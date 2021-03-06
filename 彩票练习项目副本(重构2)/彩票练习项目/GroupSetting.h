//
//  GroupSetting.h
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/5.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupSetting : NSObject

//头部标题
@property(nonatomic,copy)NSString *header;
//尾部标题
@property(nonatomic,copy) NSString *footer;
//存放着这组所有行的模型数据（这个数组中都是SettingItem对象）
@property(nonatomic,copy) NSArray * items;

@end
