//
//  WaterLayoutCell.m
//  Cycle
//
//  Created by admin on 17/6/28.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "WaterLayoutCell.h"
#import "EGCycleImagesCell.h"
#import "Masonry.h"

@interface WaterLayoutCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong)               UICollectionView                *waterCollectionView;
@property (nonatomic, strong)               NSMutableArray                  *dataSouceArray;

@end
@implementation WaterLayoutCell

-(UICollectionView *)waterCollectionView{
    if (!_waterCollectionView) {
        UICollectionViewFlowLayout *flowLayout     = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection                 = UICollectionViewScrollDirectionVertical;
        _waterCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        
        _waterCollectionView.backgroundColor        = [UIColor whiteColor];
        _waterCollectionView.delegate               = self;
        _waterCollectionView.dataSource             = self;
        _waterCollectionView.showsHorizontalScrollIndicator = NO;
        _waterCollectionView.showsVerticalScrollIndicator   = NO;
        [_waterCollectionView registerClass:[EGCycleImagesCell class] forCellWithReuseIdentifier:NSStringFromClass([EGCycleImagesCell class])];
    }
    return _waterCollectionView;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    WaterLayoutCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WaterLayoutCell class])];
    if (!cell) {
        cell = [[WaterLayoutCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([WaterLayoutCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.waterCollectionView];
        [self snapMagin];
    }
    return self;
}

-(void)snapMagin{
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_equalTo(10);
        make.top.mas_equalTo(self.contentView).mas_equalTo(10);
    }];
    
    [self.waterCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).mas_equalTo(10);
        make.top.bottom.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).mas_equalTo(-10);
    }];
}

-(void)InitDataViewModel:(GDHomeModel *)model{
    [self.titleLabel setText:model.title];
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
//设置分区
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return 1;
}
//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  CGSizeMake(20,20);
}
// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EGCycleImagesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([EGCycleImagesCell class]) forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor purpleColor];
    
    return cell;
}



@end
