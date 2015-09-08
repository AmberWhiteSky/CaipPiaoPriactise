//
//  AmProduct.h
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/7.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AmProduct : NSObject
/**
 
 "title": "网易电影票",
 "id": "com.netease.movie",
 "url": "http://itunes.apple.com/app/id583784224?mt=8",
 "icon": "movie@2x.png",
 "customUrl": "movieticket163"
 **/


@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *icon;


-(instancetype)  initWithDict:(NSDictionary *) dict;

+(instancetype)  productWithDict:(NSDictionary *) dict;

@end
