//
//  SettingItem.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/4.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "SettingItem.h"

@implementation SettingItem
+(instancetype) itemWithIcon:(NSString *) icon  title:(NSString *)title  destvcClass:(Class) destvcClass {
    
    
    SettingItem *item =[[self  alloc]init];
    item.icon =icon;
    item.title =title;
    item.destvcClass = destvcClass;
    return item;
  
}

@end
