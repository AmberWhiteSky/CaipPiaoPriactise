//
//  AmHelpHtml.h
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/13.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AmHelpHtml : NSObject
//网页标题
@property(nonatomic,copy) NSString *title;
//网页文件名
@property(nonatomic,copy) NSString *html;


//字典转模型
-(instancetype)  initWithDict:(NSDictionary *) dict;

+(instancetype)  htmlWithDict:(NSDictionary *) dict;
@end
