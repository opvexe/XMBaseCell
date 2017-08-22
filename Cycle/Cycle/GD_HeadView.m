//
//  GD_HeadView.m
//  Cycle
//
//  Created by GDBank on 2017/7/27.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "GD_HeadView.h"
#import "GDBillsControl.h"
#import "UILabel+Extension.h"
#import "Masonry.h"
#import "GDBillsMoneyControl.h"

@interface GD_HeadView ()

@property (nonatomic, strong)  UIImageView         *bankIcon;
@property (nonatomic, strong)  UILabel             *userNameLabel;
@property (nonatomic, strong)  GDBillsControl      *usableAmountControl;
@property (nonatomic, strong)  GDBillsControl      *usableScoreControl;
@property (nonatomic, strong)  UILabel             *checkBillsLabel;
@property (nonatomic, strong)  UILabel             *repaymentBillsLabel;

@property (nonatomic, strong)  GDBillsMoneyControl      *billsMoneyControl;
@property (nonatomic, strong)  GDBillsMoneyControl      *leaveMoneyControl;

@end
@implementation GD_HeadView

-(UIImageView *)bankIcon{
    if (!_bankIcon) {
        _bankIcon = [[UIImageView alloc]init];
        _bankIcon.image = [UIImage imageNamed:@"4"];
    }
    return _bankIcon;
}

-(UILabel *)userNameLabel{
    if (!_userNameLabel) {
       _userNameLabel = [UILabel labelWithTitle:@"王文权" color:[UIColor blackColor] font:[UIFont systemFontOfSize:15.0] alignment:NSTextAlignmentLeft];
    }
    return _userNameLabel;
}
-(GDBillsControl *)usableAmountControl{
    if (!_usableAmountControl) {
        _usableAmountControl = [[GDBillsControl alloc]init];
        _usableAmountControl.tag = 100 ;
        [_usableAmountControl addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _usableAmountControl;
}

-(GDBillsControl *)usableScoreControl{
    if (!_usableScoreControl) {
        _usableScoreControl = [[GDBillsControl alloc]init];
        _usableScoreControl.tag = 101;
        [_usableScoreControl addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _usableScoreControl;
}


-(UILabel *)checkBillsLabel{
    if (!_checkBillsLabel) {
        _checkBillsLabel = [UILabel labelWithTitle:@"2月份账单 01/23- 02/22" color:[UIColor blackColor] font:[UIFont systemFontOfSize:15.0] alignment:NSTextAlignmentLeft];
    }
    return _checkBillsLabel;
}

-(UILabel *)repaymentBillsLabel{
    if (!_repaymentBillsLabel) {
        _repaymentBillsLabel = [UILabel labelWithTitle:@"到期还款日 03/16" color:[UIColor blackColor] font:[UIFont systemFontOfSize:15.0] alignment:NSTextAlignmentLeft];
    }
    return _repaymentBillsLabel;
}

-(GDBillsMoneyControl *)billsMoneyControl{
    if (!_billsMoneyControl) {
        _billsMoneyControl = [[GDBillsMoneyControl alloc]init];
        _billsMoneyControl.tag = 102;
        [_billsMoneyControl addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _billsMoneyControl;
}

-(GDBillsMoneyControl *)leaveMoneyControl{
    if (!_leaveMoneyControl) {
        _leaveMoneyControl = [[GDBillsMoneyControl alloc]init];
        _leaveMoneyControl.tag = 103;
        [_leaveMoneyControl addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leaveMoneyControl;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
        
        [self addSubview:self.bankIcon];
        [self addSubview:self.userNameLabel];
        [self addSubview:self.usableAmountControl];
        [self addSubview:self.usableScoreControl];
        [self addSubview:self.checkBillsLabel];
        [self addSubview:self.repaymentBillsLabel];
        [self addSubview:self.billsMoneyControl];
        [self addSubview:self.leaveMoneyControl];
        
        
        [self.bankIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).mas_offset(10);
            make.left.mas_equalTo(self).mas_offset(10);
            make.width.height.mas_equalTo(13);
        }];
        
        [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(self.bankIcon.mas_right).mas_offset(10);
            make.top.mas_equalTo(self.bankIcon.mas_top);
        }];
        
        [self.usableAmountControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self);
            make.top.mas_equalTo(self.userNameLabel.mas_bottom).mas_offset(8);
            make.height.mas_equalTo(15);
            make.width.equalTo(self).multipliedBy(.5);
        }];
        
        [self.usableScoreControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.usableAmountControl.mas_right);
            make.top.mas_equalTo(self.userNameLabel.mas_bottom).mas_offset(8);
            make.height.mas_equalTo(15);
            make.width.equalTo(self).multipliedBy(.5);
        }];
        
        [self.checkBillsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.userNameLabel.mas_left);
            make.top.mas_equalTo(self.usableAmountControl.mas_bottom).mas_offset(10);
            make.height.mas_equalTo(30);
        }];
        
        [self.repaymentBillsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).mas_offset(-25);
            make.top.mas_equalTo(self.usableScoreControl.mas_bottom).mas_offset(10);
            make.height.mas_equalTo(30);
        }];
        
        [self.billsMoneyControl mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.mas_equalTo(self.checkBillsLabel.mas_left);
            make.right.mas_equalTo(self.repaymentBillsLabel.mas_right);
            make.top.mas_equalTo(self.checkBillsLabel.mas_bottom);
            make.height.mas_equalTo(44);
        }];
        
        [self.leaveMoneyControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.checkBillsLabel.mas_left);
            make.right.mas_equalTo(self.repaymentBillsLabel.mas_right);
            make.top.mas_equalTo(self.billsMoneyControl.mas_bottom).mas_equalTo(10);
            make.height.mas_equalTo(44);
        }];
        
        UIButton *lastButton = nil;
        for (int i = 0; i < 2; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:i == 0 ? @"我要还款" : @"我要分期" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
            button.titleLabel.font = [UIFont systemFontOfSize:15.0];
            [button addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 104 + i;
            [self addSubview:button];
            
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(30);
                make.width.equalTo(self).multipliedBy(.5);
                make.top.equalTo(self.leaveMoneyControl.mas_bottom).mas_offset(20);
                
                if (lastButton) {
                    make.left.mas_equalTo(lastButton.mas_right);
                }else{
                    make.left.mas_equalTo(self);
                }
            }];
                lastButton = button;
        }
        
    }
    return self;
}

-(void)dothings:(UIControl *)sender{
    
    NSLog(@"%ld",sender.tag);
    if (self.GDTableviewHeadBillsMoneyBlock) {
        self.GDTableviewHeadBillsMoneyBlock(sender.tag);
    }
}


@end
