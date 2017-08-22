//
//  GDHeadCollectionReusableView.m
//  Cycle
//
//  Created by admin on 2017/7/5.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "GDHeadCollectionReusableView.h"

#import "UILabel+Extension.h"
#import "Masonry.h"

@interface GDHeadCollectionReusableView ()

@property (nonatomic, strong) UILabel                   *headLabel;

@end
@implementation GDHeadCollectionReusableView

-(UILabel *)headLabel{
    if (!_headLabel) {
        _headLabel = [UILabel labelWithTitle:@"" color:[UIColor blackColor] font:[UIFont systemFontOfSize:12.0] alignment:NSTextAlignmentCenter];
    }
    return _headLabel;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [self addSubview:self.headLabel];
        
        [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.centerY.mas_equalTo(self);
        }];
    }
    return self;
}

-(void)initContentModel:(GDSeviceModel *)model{
    
    [self.headLabel setText:model.title];
    
}
@end
