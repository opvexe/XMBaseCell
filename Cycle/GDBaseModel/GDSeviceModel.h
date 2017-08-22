//
//  GDSeviceModel.h
//  Cycle
//
//  Created by admin on 2017/7/5.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDHomeModel.h"

@interface GDSeviceModel : GDHomeModel


@property (nonatomic, strong)           NSMutableArray      *sevceSouce;        //数组转模型
@end

@interface GDSevceFun : NSObject

@property (nonatomic, copy)             NSString            *seviceTitle;
@property (nonatomic, copy)             NSString            *seviceIcon;
@property (nonatomic, copy)             NSString            *ClassName;
@end
