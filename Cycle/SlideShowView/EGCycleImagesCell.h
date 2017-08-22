//
//  EGCycleImagesCell.h
//  Cycle
//
//  Created by jieku on 2017/6/13.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EGCycleImagesCell : UICollectionViewCell
@property(nonatomic,strong)UIImage *image;
@property(nonatomic,copy)NSString *imageUrl;
@property(nonatomic,strong)UIImageView *imageView;
@end
