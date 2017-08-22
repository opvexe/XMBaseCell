//
//  GDBillsControl.m
//  Cycle
//
//  Created by GDBank on 2017/7/27.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "GDBillsControl.h"

@interface GDBillsControl ()

@property (nonatomic, strong)   UILabel         *usableMoneyLabel;
@property (nonatomic, strong)   UIImageView     *arrowsImageView;

@end
@implementation GDBillsControl

-(UIImageView *)arrowsImageView{
    if (!_arrowsImageView) {
        _arrowsImageView = [[UIImageView alloc]init];
        _arrowsImageView.image = [UIImage imageNamed:@"4"];
        _arrowsImageView.userInteractionEnabled = YES;
    }
    return _arrowsImageView;
}

-(UILabel *)usableMoneyLabel{
    if (!_usableMoneyLabel) {
        _usableMoneyLabel = [UILabel labelWithTitle:@"陪你额度 50000" color:[UIColor grayColor] font:[UIFont systemFontOfSize:15.0] alignment:NSTextAlignmentLeft];
    }
    return _usableMoneyLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.usableMoneyLabel];
        [self addSubview:self.arrowsImageView];
        
        [self.usableMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self);
            make.left.mas_equalTo(self).mas_offset(35);
        }];
        
        [self.arrowsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.usableMoneyLabel.mas_top);
            make.left.mas_equalTo(self.usableMoneyLabel.mas_right).mas_offset(15);
            make.width.height.mas_equalTo(15);
        }];
        
    }
    return self;
}

@end
