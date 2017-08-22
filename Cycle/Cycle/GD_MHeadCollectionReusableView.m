//
//  GD_MHeadCollectionReusableView.m
//  Cycle
//
//  Created by GDBank on 2017/7/27.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "GD_MHeadCollectionReusableView.h"
#import "Masonry.h"
#import "GD_HeadView.h"

@interface GD_MHeadCollectionReusableView ()<UIScrollViewDelegate>

@property (nonatomic, strong)   UIScrollView   *billScrollView;
@property (nonatomic, strong)   UIPageControl  *pageControl;

@end
@implementation GD_MHeadCollectionReusableView

-(UIScrollView *)billScrollView{
    if (!_billScrollView) {
        _billScrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _billScrollView.showsHorizontalScrollIndicator=NO;
        _billScrollView.pagingEnabled=YES;
        _billScrollView.delegate=self;
    }
    return _billScrollView;
}

-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.currentPage=0;
        _pageControl.currentPageIndicatorTintColor=[UIColor yellowColor];
        _pageControl.pageIndicatorTintColor=[UIColor redColor];
    }
    return _pageControl;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        for (int i=0; i< 3; i++) {
            CGFloat imageViewX =i * self.billScrollView.frame.size.width;
            GD_HeadView *head = [[GD_HeadView alloc]initWithFrame:CGRectMake(imageViewX, 0, self.billScrollView.frame.size.width, self.billScrollView.frame.size.height)];
            head.backgroundColor = [UIColor yellowColor];
            
            head.GDTableviewHeadBillsMoneyBlock = ^(NSInteger tag) {
                NSLog(@"%ld",tag);
            };
            [self.billScrollView addSubview:head];
        }
        
        CGFloat Width=3 * self.billScrollView.frame.size.width;
        self.billScrollView.contentSize=CGSizeMake(Width, 0);
        self.pageControl.numberOfPages  = 3;    //总个数
        
        [self addSubview:self.billScrollView];
        [self addSubview:self.pageControl];

        [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_bottom).mas_offset(-15.0);
            make.centerX.mas_equalTo(self.mas_centerX);
            make.height.mas_equalTo(10);
            make.width.mas_equalTo(100);
        }];
        
    }
    return self;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint offset=scrollView.contentOffset;
    
    NSInteger currentPage=offset.x / self.billScrollView.frame.size.width;
    
    self.pageControl.currentPage=currentPage;

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    

}
@end
