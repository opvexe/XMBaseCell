//
//  GDBillsMoneyControl.m
//  Cycle
//
//  Created by GDBank on 2017/7/28.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "GDBillsMoneyControl.h"


@interface GDBillsMoneyControl ()

@property(nonatomic, strong)    UILabel     *billTitleLabel;
@property(nonatomic, strong)    UILabel     *checkLabel;
@property(nonatomic, strong)    UILabel     *RMB_MoneyLabel;
@property(nonatomic, strong)    UILabel     *Dollar_MoneyLabel;

@end

@implementation GDBillsMoneyControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.billTitleLabel =  [UILabel labelWithTitle:@"查询金额" color:[UIColor blackColor] font:[UIFont systemFontOfSize:15.0] alignment:NSTextAlignmentLeft];
        
        self.checkLabel =  [UILabel labelWithTitle:@"查询" color:[UIColor blackColor] font:[UIFont systemFontOfSize:15.0] alignment:NSTextAlignmentCenter];
        self.checkLabel.layer.masksToBounds = YES;
        self.checkLabel.layer.cornerRadius  = 5.0f;
        self.checkLabel.layer.borderWidth   = 1.0;
        self. checkLabel.layer.borderColor  = [UIColor blackColor].CGColor;
        
        self.RMB_MoneyLabel =  [UILabel labelWithTitle:@"￥10000.00" color:[UIColor blackColor] font:[UIFont systemFontOfSize:15.0] alignment:NSTextAlignmentLeft];

        self.Dollar_MoneyLabel =  [UILabel labelWithTitle:@"$300.00" color:[UIColor blackColor] font:[UIFont systemFontOfSize:15.0] alignment:NSTextAlignmentLeft];
        
        [self addSubview:self.billTitleLabel];
        [self addSubview:self.checkLabel];
        [self addSubview:self.RMB_MoneyLabel];
        [self addSubview:self.Dollar_MoneyLabel];
        
        [self.billTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            make.top.mas_equalTo(self).mas_offset(10);
        }];
        
        [self.checkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.billTitleLabel.mas_right).mas_offset(10);
            make.top.mas_equalTo(self).mas_offset(10);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(20);
        }];
        
        [self.RMB_MoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.mas_equalTo(self).mas_offset(10);
            make.right.mas_equalTo(self);
        }];
        
        [self.Dollar_MoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.top.mas_equalTo(self.RMB_MoneyLabel.mas_bottom).mas_offset(10);
            make.right.mas_equalTo(self);
        }];
        
    }
    return self;
}

@end
