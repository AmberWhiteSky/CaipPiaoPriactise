//
//  AmProduct.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/7.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "AmProduct.h"

@implementation AmProduct
-(instancetype)  initWithDict:(NSDictionary *) dict{
    if (self=[super  init]) {
        
        self.icon =dict[@"icon"];
        self.title = dict [@"title"];
        self.customurl = dict[@"customurl"];
        self.url =dict[@"url"];
//        [self  setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}

+(instancetype)  productWithDict:(NSDictionary *) dict{
    return  [[self alloc] initWithDict:dict];
    
}
@end
