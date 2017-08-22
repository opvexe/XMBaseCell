//
//  GDBaseCell.m
//  Cycle
//
//  Created by admin on 17/6/28.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "GDBaseCell.h"

@implementation GDBaseCell

/* 懒加载 控件*/
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel labelWithTitle:@"" color:[UIColor blackColor] font:[UIFont systemFontOfSize:12.0] alignment:NSTextAlignmentLeft];
    }
    return _titleLabel;
}

-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [UILabel labelWithTitle:@"" color:[UIColor blackColor] font:[UIFont systemFontOfSize:12.0] alignment:NSTextAlignmentLeft];
    }
    return _contentLabel;
}

-(UIImageView *)rightImageIcon{
    if (!_rightImageIcon) {
        _rightImageIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"plus-big"] highlightedImage:[UIImage imageNamed:@"plus-big"]];
        [_rightImageIcon setHidden:YES];
    }
    return _rightImageIcon;
}

-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    return nil;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle  = UITableViewCellSelectionStyleNone ;
        
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.rightImageIcon];
        [self.contentView addSubview:self.contentLabel];
    }
    return self;
}

-(void)InitDataViewModel:(GDHomeModel *)model{
    
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    
    frame.origin.x = 10;
    frame.size.width -= 10 * 2;
    // 更改顶部间距、每个cell之间的间距
    frame.origin.y += 10;
    frame.size.height -= 10;
}

@end
