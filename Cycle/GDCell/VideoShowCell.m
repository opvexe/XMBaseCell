//
//  VideoShowCell.m
//  Cycle
//
//  Created by admin on 17/6/28.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "VideoShowCell.h"
#import "EGCycleImagesCell.h"
#import "Masonry.h"

@interface VideoShowCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *videoShowCollectionView;


@end
@implementation VideoShowCell

-(UICollectionView *)videoShowCollectionView{
    if (!_videoShowCollectionView) {
        
        UICollectionViewFlowLayout *flowLayout                  = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection                              = UICollectionViewScrollDirectionHorizontal;
        _videoShowCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _videoShowCollectionView.showsHorizontalScrollIndicator = YES;      //水平滚动条显示
        _videoShowCollectionView.showsVerticalScrollIndicator   = NO;
        _videoShowCollectionView.backgroundColor                = [UIColor whiteColor];
        _videoShowCollectionView.dataSource                     = self;
        _videoShowCollectionView.delegate                       = self;
        [_videoShowCollectionView registerClass:[EGCycleImagesCell class] forCellWithReuseIdentifier:NSStringFromClass([EGCycleImagesCell class])];
    }
    return _videoShowCollectionView;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    VideoShowCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([VideoShowCell class])];
    if (!cell) {
        cell = [[VideoShowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([VideoShowCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.videoShowCollectionView];
        
        [self snapMagin];
    }
    return self;
}

-(void)snapMagin{
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_equalTo(10);
        make.centerY.mas_equalTo(self.contentView);
    }];
    
    [self.videoShowCollectionView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).mas_equalTo(10);
        make.top.bottom.mas_equalTo(self.contentView).mas_equalTo(0);
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
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  CGSizeMake(40,40);
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
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}





@end
