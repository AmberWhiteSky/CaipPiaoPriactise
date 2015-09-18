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
#import "AmProduct.h"
#import "AmProductCell.h"

@interface AmGridController ()
@property(nonatomic,strong) NSArray *products;

@end

@implementation AmGridController

static NSString * const reuseIdentifier = @"Cell";


//懒加载
- (NSArray *)products {
    if (_products==nil) {
        //json 文件路径
        NSString *path =[[NSBundle  mainBundle] pathForResource:@"product.json" ofType:nil];
        //加载json文件
        NSData *data=   [NSData  dataWithContentsOfFile:path];
        //将json 数据转化为nsarray 或者nsdictionary
        
        NSArray *dictArray =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        //        NSLog(@"%@",[dictArray[0] class]);
        
        //将字典转为模型
        NSMutableArray *productArray =[NSMutableArray  array];
        for (NSDictionary*dict in  dictArray) {
            AmProduct  *p =[AmProduct  productWithDict:dict];
            [productArray  addObject:p ];
        }
        _products =productArray;
        
    }
    return  _products;
    
}


-(id)init {
    //1.流水布局
    UICollectionViewFlowLayout *layout  =[[UICollectionViewFlowLayout  alloc] init];
    //2.设置item 大小  每个cell的尺寸
    layout.itemSize = CGSizeMake(100, 100);
    //3.设置水间距
    
    layout.minimumInteritemSpacing =0;
    //4.设置垂直间距
    layout.minimumLineSpacing=10;
    
   //5.设置四周的哪边距
//    layout.sectionInset =UIEdgeInsetsMake(100, 10, 50, 70);
    layout.sectionInset = UIEdgeInsetsMake(layout.minimumLineSpacing, 0, 0, 0);
    
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    
    // Register cell classes  代码
    //注册cell 告诉collectionView 将来创建怎么样的cell
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:AmGridControllerCellID];
    
    //xib 加载cell
    UINib *nib =[UINib  nibWithNibName:@"AmProductCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:AmGridControllerCellID];
    
    //设置collectionView的背景色
    self.collectionView.backgroundColor =[UIColor  whiteColor];
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
    return  self.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    //1.获得cell
    AmProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AmGridControllerCellID forIndexPath:indexPath];
    
    // Configure the cell
    
    //2.传递模型
    cell.product =self.products[indexPath.item];
    
    
    return cell;
}

#pragma  mark  collectionView 代理方法 监听点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   
    AmProduct *p = self.products[indexPath.item];
    
    
    NSURL *cutomurl =[NSURL  URLWithString:p.customurl];
    UIApplication *app =[UIApplication  sharedApplication];
    if ([app  canOpenURL:cutomurl]) {//有安装此应用
        //打开应用
        [app openURL:cutomurl];
    }else{
    //打开appstore
        [app  openURL:[NSURL URLWithString:p.url]];
    }
    NSLog(@"collectionView点击%@", p.title);
    
    
//    [UIApplication   sharedApplication]  openURL:];
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
