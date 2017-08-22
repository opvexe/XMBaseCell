//
//  GDSeviceButton.m
//  Cycle
//
//  Created by admin on 2017/7/5.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "GDSeviceButton.h"

@implementation GDSeviceButton
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    CGRect iconFrame = [self imageView].frame;
    iconFrame.origin.x = _space/2;
    iconFrame.origin.y = 0;
    iconFrame.size.width = self.frame.size.width - _space;
    iconFrame.size.height = self.frame.size.width - _space;
    self.imageView.frame = iconFrame ;

    
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = self.imageView.frame.size.height + 5;
    newFrame.size.width = self.frame.size.width;
    newFrame.size.height = 20;
    
    self.titleLabel.frame= newFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}


@end
