//
//  GDSevcieCollectionViewCell.m
//  Cycle
//
//  Created by admin on 2017/7/5.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "GDSevcieCollectionViewCell.h"
#import "GDSeviceButton.h"

@interface GDSevcieCollectionViewCell ()

@property (nonatomic, strong)               GDSeviceButton                        *seviceButton;
@end
@implementation GDSevcieCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        GDSeviceButton *btn = [GDSeviceButton buttonWithType:UIButtonTypeCustom];
        btn.frame =  self.bounds;
        btn.space = 20.0;
        [[btn imageView]setContentMode:UIViewContentModeScaleAspectFit];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:10.0]];
        btn.layer.masksToBounds = YES;
        btn.layer.borderColor   = [UIColor greenColor].CGColor;
        btn.layer.borderWidth   = 1.0f;
        
        [btn addTarget:self action:@selector(dothings:) forControlEvents:UIControlEventTouchUpInside];
        self.seviceButton = btn;
        [self addSubview:btn];
        
    }
    return self;
}

-(void)InitDataViewModel:(GDSevceFun *)model{
    [_seviceButton setTitle:model.seviceTitle forState:UIControlStateNormal];
    [_seviceButton setTitle:model.seviceTitle forState:UIControlStateSelected];
    [_seviceButton setTitle:model.seviceTitle forState:UIControlStateDisabled];
    [_seviceButton setTitle:model.seviceTitle forState:UIControlStateHighlighted];
    [_seviceButton setImage:[UIImage imageNamed:model.seviceIcon] forState:UIControlStateNormal];
    [_seviceButton setImage: [UIImage imageNamed:model.seviceIcon] forState:UIControlStateHighlighted];
}

-(void)dothings:(UIButton *)sender{

    if (self.delegate&&[self.delegate respondsToSelector:@selector(clickSeviceIndexSender:)]) {
        [ self.delegate clickSeviceIndexSender:sender];
    }
}


@end
