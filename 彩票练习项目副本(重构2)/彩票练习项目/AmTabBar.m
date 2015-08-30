//
//  AmTabBar.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/8/29.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "AmTabBar.h"
#import "AmTabBarButton.h"


#define AmTabBarButtonCount 5

@interface AmTabBar ()
//用来记录当前选中的按钮
@property(nonatomic,weak) AmTabBarButton *selectedButton;
@end

@implementation AmTabBar

//

-(void)addButtonWithName:(NSString *)name selectName:(NSString *)selectName {
    
    //创建按钮
    AmTabBarButton *button  =[AmTabBarButton  buttonWithType:UIButtonTypeCustom];
    //给按钮设置索引
    //设置图片
    
    [button  setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    //设置选中图片
    [button  setBackgroundImage:[UIImage imageNamed:selectName] forState:UIControlStateSelected];
    // 添加
    [self addSubview:button];
    
    //监听
#warning UIControlEventTouchDown  手指一按下去就触发这个事件
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //按钮的tag
    //    button.tag =self.subviews.count-1;
    
    //设置默认监听第一个
    if (self.subviews.count==1) {
        [self buttonClick:button];
    }
}





//重写layoutSubviews
-(void)layoutSubviews {
    [super layoutSubviews];
    
    int  count =self.subviews.count;
    for (int i=0; i<count; i++) {
        AmTabBarButton *button  =self.subviews[i];
        //按钮的tag
        button.tag=i;
        //设置frame
        CGFloat buttonY =0;
        CGFloat butonW =self.frame.size.width/count;
        CGFloat buttonH =self.frame.size.height;
        CGFloat buttonX = i*butonW;
        button.frame =CGRectMake(buttonX, buttonY, butonW, buttonH);
    }
}



//按钮状态  normal  普通  ／ highlighted 高亮  disable:enabled ＝no  /selected  选中  selected=yes
//按钮点击监听方法
-(void)buttonClick: (AmTabBarButton  *)button{
    
    
    //0.通知代理
    if ([self.delegate  respondsToSelector:@selector(tabbar:didSelectButtonFrom:to:)]) {
        [self.delegate tabbar:self didSelectButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    
    //1.让当前选中按钮取消选中
    self.selectedButton.selected=NO;
    //2. 让新点击的按钮选中
    button.selected=YES;
    //3.新点击的按钮就成为当前选中
    self.selectedButton=button;
}
@end
