//
//  SettingArrowItem.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/5.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "SettingArrowItem.h"

@implementation SettingArrowItem


+(instancetype) itemWithIcon:(NSString *) icon  title:(NSString *)title  destvcClass:(Class) destvcClass {
    
    SettingArrowItem *item =[self  itemWithIcon:icon title:title];
    item.destvcClass = destvcClass;
    return item;
    
}

@end
