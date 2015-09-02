//
//  UIImage+Extension.m
//  20150611_qq聊天记录界面实现
//
//  Created by AmberWhiteSky on 15/6/22.
//  Copyright (c) 2015年 juchuan. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)


//处理图片的方法  通过图片名字来对图片进行处理
//返回一张可以随意拉升不变形的的图片
+(UIImage  *)  resizeableImage:(NSString *)name {
    
    UIImage *normalimage = [UIImage imageNamed:name];
    CGFloat w  =normalimage.size.width*0.5;
    CGFloat h = normalimage.size.height*0.5;
    return  [normalimage  resizableImageWithCapInsets:UIEdgeInsetsMake(h,w, h, w)];
}
@end
