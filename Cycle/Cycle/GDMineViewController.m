//
//  GDMineViewController.m
//  Cycle
//
//  Created by GDBank on 2017/7/27.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "GDMineViewController.h"
#import "GDSevcieCollectionViewCell.h"
#import "MJExtension.h"
#import "GD_MHeadCollectionReusableView.h"
#import "GDBillsMoneyViewController.h"

@interface GDMineViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,clickSeviceFunDelegate>

@property (nonatomic, strong)               UICollectionView                *seviceCollectionView;
@property (nonatomic, strong)               NSMutableArray                  *seviceSouce;

@end

@implementation GDMineViewController

-(UICollectionView *)seviceCollectionView{
    if (!_seviceCollectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _seviceCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:flowLayout];
        _seviceCollectionView.showsHorizontalScrollIndicator = NO;
        _seviceCollectionView.showsVerticalScrollIndicator   = NO;
        _seviceCollectionView.dataSource                     = self;
        _seviceCollectionView.delegate                       = self;
        _seviceCollectionView.backgroundColor                = [UIColor whiteColor];
        [_seviceCollectionView registerClass:[GDSevcieCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([GDSevcieCollectionViewCell class])];
        [_seviceCollectionView registerClass:[GD_MHeadCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([GD_MHeadCollectionReusableView class])];
    }
    return _seviceCollectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *dataSocure= @[
                           @{@"title":@"陪你服务",@"sevceSouce":@[@{@"seviceTitle":@"陪你项目",@"seviceIcon":@"4",@"ClassName":@"UpdateNicknameViewController"},@{@"seviceTitle":@"陪你服务",@"seviceIcon":@"4",@"ClassName":@"UpdateNicknameViewController"},@{@"seviceTitle":@"陪你激活",@"seviceIcon":@"4",@"ClassName":@"UpdateNicknameViewController"},@{@"seviceTitle":@"陪你申请",@"seviceIcon":@"4",@"ClassName":@"UpdateNicknameViewController"},@{@"seviceTitle":@"陪你金额",@"seviceIcon":@"4",@"ClassName":@"UpdateNicknameViewController"},@{@"seviceTitle":@"陪你活动活",@"seviceIcon":@"4",@"ClassName":@"UpdateNicknameViewController"}]},
                           ];
    
    _seviceSouce = [GDSeviceModel mj_objectArrayWithKeyValuesArray:dataSocure];
    [self.seviceCollectionView reloadData];
    [self.view addSubview:self.seviceCollectionView];
}


#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView{
    
    return _seviceSouce.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    GDSeviceModel  *model  = _seviceSouce[section];
    return model.sevceSouce.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat  width =  [UIScreen mainScreen].bounds.size.width/3;
    return  CGSizeMake(width,width);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {  // 设置最小行间距，也就是前一行与后一行的中间最小间隔
    return 20;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {     // 设置最小列间距，也就是左行与右一行的中间最小间隔
    return 0;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{ //(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    return UIEdgeInsetsMake(30, 0, 10, 0);                //距离区头20 - 区尾20 -- 左边距10 - 右边距 10
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return (CGSize){[UIScreen mainScreen].bounds.size.width,250};
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
    UICollectionReusableView *reusable = nil;       //防止区头重用 要自定义  UICollectionReusableView
    if (kind == UICollectionElementKindSectionHeader) {
        GD_MHeadCollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([GD_MHeadCollectionReusableView class]) forIndexPath:indexPath];
        
        reusable = reusableView;
    }
    return reusable;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GDSevcieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([GDSevcieCollectionViewCell class]) forIndexPath:indexPath];
    
    GDSeviceModel  *model  = _seviceSouce[indexPath.section];
    [cell InitDataViewModel:model.sevceSouce[indexPath.row]];
     cell.delegate        = self;
    return cell;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    NSLog(@"选中高亮:= %s",__func__);
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"设备被点击:%ld == %ld",(long)indexPath.section,(long)indexPath.row);
    
}

-(NSMutableArray *)seviceSouce{
    if (!_seviceSouce) {
        _seviceSouce = [[NSMutableArray alloc]initWithCapacity:0];
    }
    return _seviceSouce;
}


-(void)clickSeviceIndexSender:(UIButton *)sender{
    
//    GDBillsMoneyViewController *money = [[GDBillsMoneyViewController alloc]init];
//    [self.navigationController pushViewController:money animated:YES];
    
}


@end
