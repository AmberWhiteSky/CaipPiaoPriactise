//
//  SettingArrowItem.h
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/5.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "SettingItem.h"

//typedef  enum {
//    SettingArrowItemVcShowTypePush,
//    SettingArrowItemVcShowTypeModel
//}SettingArrowItemVcShowType;

@interface SettingArrowItem : SettingItem


//点击这行cell 需要跳转控制器
@property(nonatomic,assign)  Class  destvcClass;
//@property(nonatomic,assign) SettingArrowItemVcShowType vcShowType;


//跳转的方法
+(instancetype) itemWithIcon:(NSString *) icon  title:(NSString *)title  destvcClass:(Class) destvcClass;

+(instancetype) itemWithtitle:(NSString *)title  destvcClass:(Class) destvcClass;

@end
