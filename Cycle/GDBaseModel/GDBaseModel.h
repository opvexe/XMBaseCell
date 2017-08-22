//
//  GDBaseModel.h
//  Cycle
//
//  Created by admin on 17/6/27.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {     //定义四种不同的Cell类型
    NormalCellType = 1,
    WaterLayoutCellType,
    VideoCellType,
} GDCellType;

@interface GDBaseModel : NSObject

@property (nonatomic, copy)         NSString *ClassName;
@property (nonatomic, assign)       BOOL     isAllowPush;   //是否允许跳转(未登录-不允许跳转，已登录 - 允许跳转)
@property (nonatomic, assign)       GDCellType CellType;
@property (nonatomic, assign)       NSInteger controllerType;       //1001 push ,1002 ,dismiss

@end
