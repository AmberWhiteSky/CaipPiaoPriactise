//
//  AmTabBar.h
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/8/29.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  AmTabBar;
@protocol  AmTabBarDelegate<NSObject>

@optional
-(void) tabbar:(AmTabBar *) tabBar didSelectButtonFrom:(int)  from to:(int) to;
@end

@interface AmTabBar : UIView
@property(nonatomic ,weak) id<AmTabBarDelegate>  delegate;
@end
