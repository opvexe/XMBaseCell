//
//  EGCycleView.m
//  Cycle
//
//  Created by jieku on 2017/6/13.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "EGCycleView.h"
#import "EGCycleImagesCell.h"

#define kZoomProportion CGAffineTransformMakeScale(1.1, 1.1)
#define kNormalProportion CGAffineTransformMakeScale(1.0, 1.0)

@interface EGCycleView ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSInteger index;
    BOOL isNotPeopleDrag;
}

@property(nonatomic,strong)UICollectionView *myCollectionView;
@property(nonatomic,strong)UIPageControl *myPageControl;

@property(nonatomic,strong)NSTimer *myTimer;
@end
@implementation EGCycleView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUI];
    }
    return self;
}
#pragma mark - setUI
-(void)setUI
{
    index = 0;
    [self addSubview:self.myCollectionView];
    [self addSubview:self.myPageControl];
}
#pragma mark - startTimer
-(void)stopTimer
{
    [self.myTimer invalidate];
}
-(void)startTimer
{
    self.myTimer = [NSTimer timerWithTimeInterval:self.intervalTime ? self.intervalTime : 2 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.myTimer forMode:NSRunLoopCommonModes];
}
-(void)timerAction:(NSTimer *)timer
{
    if (index == self.images.count) {
        
        [self.myCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.myPageControl.currentPage = 0;
        index = 1;
        isNotPeopleDrag = YES;
        
    }else
    {
        [self.myCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:1] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:index ? YES : NO];
        self.myPageControl.currentPage = index;
        index += 1;
    }
}


#pragma mark - pageControlAction
-(void)pageControlAction:(UIPageControl*)pageControl
{
    index = pageControl.currentPage;
    [self.myCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:pageControl.currentPage inSection:1] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EGCycleImagesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([EGCycleImagesCell class]) forIndexPath:indexPath];
    
    if ([self.images[indexPath.row] isKindOfClass:[UIImage class]]) {
        
        cell.image = self.images[indexPath.row];
        
    }else if([self.images[indexPath.row] isKindOfClass:[NSString class]]) {
        
        cell.imageUrl = self.images[indexPath.row];
    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(EGCycleImagesCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    [UIView animateWithDuration:self.myTimer.timeInterval animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        cell.imageView.transform = kNormalProportion;
    }];
}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(EGCycleImagesCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    cell.imageView.transform = kZoomProportion;
}
#pragma mark - scrollViewDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if (isNotPeopleDrag) {
        
        [self.myCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
        isNotPeopleDrag = NO;
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentIndex = (NSInteger)(scrollView.contentOffset.x / scrollView.frame.size.width) % self.images.count;
    self.myPageControl.currentPage = currentIndex;
    index = currentIndex;
    [self.myCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:currentIndex inSection:1] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

#pragma mark - setting
-(void)setImages:(NSArray *)images
{
    _images = images;
    self.myPageControl.numberOfPages = images.count;
    [self.myCollectionView reloadData];
    [self.myCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [self startTimer];
    [self.myTimer fire];
}
-(void)setIntervalTime:(CGFloat)intervalTime
{
    _intervalTime = intervalTime;
    [self stopTimer];
    [self startTimer];
}
#pragma mark - lazy
-(UIPageControl *)myPageControl
{
    if (!_myPageControl) {
        
        _myPageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
        _myPageControl.center = CGPointMake(self.center.x, self.frame.size.height - 10);
        _myPageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _myPageControl.currentPageIndicatorTintColor = [UIColor redColor];
        [_myPageControl addTarget:self action:@selector(pageControlAction:) forControlEvents:UIControlEventValueChanged];
        _myPageControl.currentPage = 0;
    }
    return _myPageControl;
}
-(UICollectionView *)myCollectionView
{
    if (!_myCollectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.itemSize = self.bounds.size;
        
        _myCollectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _myCollectionView.pagingEnabled = YES;
        _myCollectionView.bounces = NO;
        _myCollectionView.showsHorizontalScrollIndicator = NO;
        _myCollectionView.showsVerticalScrollIndicator   = NO;
        
        _myCollectionView.dataSource = self;
        _myCollectionView.delegate = self;
        
        [_myCollectionView registerClass:[EGCycleImagesCell class] forCellWithReuseIdentifier:NSStringFromClass([EGCycleImagesCell class])];
        
        _myCollectionView.backgroundColor = [UIColor lightGrayColor];
        
        
    }
    return _myCollectionView;
}
@end
