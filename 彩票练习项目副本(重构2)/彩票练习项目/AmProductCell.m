//
//  AmProductCell.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/8.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
//

#import "AmProductCell.h"
#import "AmProduct.h"

//类的扩展
@interface AmProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconview;
@property (weak, nonatomic) IBOutlet UILabel *namelable;

@end

@implementation AmProductCell

//重写set方法
-(void)setProduct:(AmProduct *)product {
    _product=product;
    
    //1.设置头像
    self.iconview.image =[UIImage  imageNamed:product.icon];
    
    
    //2.设置名称
    self.namelable.text =product.title;
}
@end
