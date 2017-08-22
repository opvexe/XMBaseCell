//
//  NormalCell.m
//  Cycle
//
//  Created by admin on 17/6/27.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "NormalCell.h"

#import "Masonry.h"

@interface NormalCell ()

@end
@implementation NormalCell


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    NormalCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NormalCell class])];
    if (!cell) {
        cell = [[NormalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([NormalCell class])];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self snapMagin];
    }
    return self;
}

/* 适配 Masony*/
-(void)snapMagin{
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(1.0f);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(10);
        make.centerY.mas_equalTo(self.contentView);
    }];
    
    [self.rightImageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_equalTo(10);
        make.centerY.mas_equalTo(self.contentView);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.rightImageIcon.mas_left).mas_equalTo(-10);
        make.centerY.mas_equalTo(self.contentView);
    }];
    
}
/*数据模型赋值*/
-(void)InitDataViewModel:(GDHomeModel *)model{
    [self.titleLabel setText:model.title];
    [self.contentLabel setText:model.content];
    [self.rightImageIcon setHidden:model.isRightHide];
    
    if (model.isRightHide) {        //up_Masony  
        [self.rightImageIcon mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView);
            make.width.height.mas_equalTo(0);
        }];
    }else{
        [self.rightImageIcon mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView).mas_equalTo(-10);
            make.width.height.mas_equalTo(20);
        }];
    }
    
    if (model.isTopHideLine) {
        [self.lineView setHidden:YES];
    }else{
        [self.lineView setHidden:NO];
    }
    
}
@end
