//
//  EGCycleImagesCell.m
//  Cycle
//
//  Created by jieku on 2017/6/13.
//  Copyright © 2017年 jieku. All rights reserved.
//

#import "EGCycleImagesCell.h"
#import "UIImageView+Extension.h"

#define kZoomProportion CGAffineTransformMakeScale(1.1, 1.1)
@implementation EGCycleImagesCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        self.imageView.transform = kZoomProportion;
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.imageView.clipsToBounds = true;
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

-(void)setImage:(UIImage *)image{
    _image = image ;
    self.imageView.image = image;
}

-(void)setImageUrl:(NSString *)imageUrl
{
    _imageUrl = imageUrl;
    self.imageView.image = [UIImage imageNamed:imageUrl];
//   [self.imageView set_Image:[NSURL URLWithString:imageUrl] placeholderImage:nil];
}
@end
