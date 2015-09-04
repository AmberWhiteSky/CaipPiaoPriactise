//
//  SettingItem.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/4.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "SettingItem.h"

@implementation SettingItem
+(instancetype) itemWithIcon:(NSString *) icon  title:(NSString *)title  vcClass:(Class) vcClass {
    
    
    SettingItem *item =[[self  alloc]init];
    item.icon =icon;
    item.title =title;
    item.vcClass = vcClass;
    return item;
  
}

@end
