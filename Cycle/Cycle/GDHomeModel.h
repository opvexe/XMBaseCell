//
//  GDHomeModel.h
//  Cycle
//
//  Created by admin on 17/6/27.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDBaseModel.h"

@interface GDHomeModel : GDBaseModel

@property (nonatomic, copy)     NSString        *title;     
@property (nonatomic, assign)   bool            isRightHide;
@property (nonatomic, copy)     NSString        *content; 
@property (nonatomic, copy)     NSString        *navigationTitle;
@property (nonatomic, assign)   bool            isTopHideLine;

@end
