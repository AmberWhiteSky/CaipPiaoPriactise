//
//  AmTitleButton.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/8/31.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "AmTitleButton.h"

@interface AmTitleButton ()
@property (nonatomic ,strong) UIFont *titlefont;
@end

@implementation AmTitleButton


-(void)awakeFromNib {
    
}


//从文件中解析一个对象的时候就会调用这个方法
-(id)initWithCoder:(NSCoder *)decoder {
    if (self =[super  initWithCoder:decoder]) {
        [self setup];
    }
    return self;
}
//系统自带方法
-(instancetype)initWithFrame:(CGRect)frame {
    if (self=[super initWithFrame:frame]) {
        [self  setup];
    }
    return self;
}

//自己的方法
-(void)  setup{
    self.titlefont =[UIFont  systemFontOfSize:15];
    self.titleLabel.font =self.titlefont;
    //图标居中
    self.imageView.contentMode =UIViewContentModeCenter;
    
}

// 控制器内部的label的frame
//contentRect 按钮自己的边框
-(CGRect)titleRectForContentRect:(CGRect)contentRect {
    
    CGFloat titleX=0;
    CGFloat titleY=0;
    NSDictionary* attrs =@{NSFontAttributeName :self.titlefont};
    
    CGFloat titleW;
    if ([[UIDevice  currentDevice].systemVersion doubleValue]>=7.0) {
        //7.0
        
        titleW=[self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    }else{
        //7.0以下
        CGFloat titleW=[self.currentTitle sizeWithFont:self.titlefont].width;
        
    }
    CGFloat titleH=contentRect.size.height;
    
    return CGRectMake(titleX, titleY , titleW, titleH );
    
    
}

//控制器内部的imageview的frame

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW=30;
    CGFloat imageX=contentRect.size.width-imageW;
    CGFloat imageY=0;
    CGFloat imageH=contentRect.size.height;
    
    return  CGRectMake(imageX, imageY , imageW, imageH );
    ;
}
@end
