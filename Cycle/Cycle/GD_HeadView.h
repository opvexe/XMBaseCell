//
//  GD_HeadView.h
//  Cycle
//
//  Created by GDBank on 2017/7/27.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 账单类型
 **/
typedef enum : NSUInteger {
    GDMineHaveBills = 1,
    GDMineNoneBills = 2,
} GDBillsType;

@interface GD_HeadView : UIView

@property (nonatomic, strong)   void(^GDTableviewHeadBillsMoneyBlock)(NSInteger tag);

@end
