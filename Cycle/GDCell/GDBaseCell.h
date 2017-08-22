//
//  GDBaseCell.h
//  Cycle
//
//  Created by admin on 17/6/28.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDHomeModel.h"
#import "UILabel+Extension.h"

@protocol clickCellDelegate <NSObject>

@optional
-(void)clickAction:(UIButton *)sender IndexPath:(NSIndexPath *)indexPath;

@end
@interface GDBaseCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

-(void)InitDataViewModel:(GDHomeModel *)model;

/*暴露公用的属性*/
@property (nonatomic, strong)           UILabel         *titleLabel;
@property (nonatomic, strong)           UILabel         *contentLabel;
@property (nonatomic, strong)           UIImageView     *rightImageIcon;
@property (nonatomic, strong)           UIView          *lineView;

@end
