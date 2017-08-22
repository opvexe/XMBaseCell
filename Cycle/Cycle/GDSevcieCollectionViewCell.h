//
//  GDSevcieCollectionViewCell.h
//  Cycle
//
//  Created by admin on 2017/7/5.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDSeviceModel.h"

@protocol clickSeviceFunDelegate <NSObject>

-(void)clickSeviceIndexSender:(UIButton *)sender;

@end
@interface GDSevcieCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak)                 id<clickSeviceFunDelegate>delegate;

-(void)InitDataViewModel:(GDSevceFun *)model;

@end
