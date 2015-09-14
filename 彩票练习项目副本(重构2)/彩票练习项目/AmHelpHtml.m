//
//  AmHelpHtml.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/13.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "AmHelpHtml.h"

@implementation AmHelpHtml


-(instancetype)  initWithDict:(NSDictionary *) dict{
    if (self=[super  init]) {
        
        self.html =dict[@"html"];
        self.title = dict [@"title"];
        self.ID =dict [@"id"];
        //        [self  setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}

+(instancetype)  htmlWithDict:(NSDictionary *) dict{
    return  [[self alloc] initWithDict:dict];
    
}
@end
