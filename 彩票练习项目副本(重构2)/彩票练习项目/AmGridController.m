//
//  AmGridController.m
//  彩票练习项目
//
//  Created by AmberWhiteSky on 15/9/7.
//  Copyright (c) 2015年 AmberWhiteSky. All rights reserved.
/**  
 UICollectionView must be initialized with a non-nil layout parameter'

必须用一个非nil的layout 参数来初始化 UICollectionView 
 
 **/
//  九宫格的界面 产品


#define AmGridControllerCellID @"product"

#import "AmGridController.h"

@interface AmGridController ()

@end

@implementation AmGridController

static NSString * const reuseIdentifier = @"Cell";


-(id)init {
    //1.流水布局
    UICollectionViewFlowLayout *layout  =[[UICollectionViewFlowLayout  alloc] init];
    //设置item 大小  每个cell的尺寸
    layout.itemSize = CGSizeMake(100, 100);
    
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    
    // Register cell classes
    //注册cell 告诉collectionView 将来创建怎么样的cell
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:AmGridControllerCellID];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete method implementation -- Return the number of sections
//    return 0;
//}






//  总共多少选项
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //获得cell
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AmGridControllerCellID forIndexPath:indexPath];
    
    // Configure the cell
    
    cell.backgroundColor = [UIColor  orangeColor];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
