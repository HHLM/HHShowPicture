//
//  ShowPictureView.m
//  HHShowPictures
//
//  Created by LXH on 2017/2/23.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "ShowPictureView.h"


#define kWidth ([UIScreen mainScreen].bounds.size.width)
static const NSUInteger kPicCount = 9; //最多展示的图片
static const CGFloat  kMargin = 10;

@implementation ShowPictureView
{
    NSArray *_images;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        for (int i = 0;i < kPicCount; i ++) {
            UIImageView *imgView = [[UIImageView alloc] init];
            imgView.contentMode = UIViewContentModeScaleAspectFill;
            imgView.layer.masksToBounds = YES;
            imgView.userInteractionEnabled = YES;
            imgView.tag = i;
            [imgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgDidClick:)]];
            [self addSubview:imgView];
        }
        
    }
    return self;
}

- (void)imgDidClick:(UITapGestureRecognizer *)tap
{
    if (_delegate && [_delegate respondsToSelector:@selector(showmePictureView:index:)]) {
        [_delegate showmePictureView:self index:tap.view.tag];
    }
}
- (NSInteger)picCount
{
    NSUInteger count = self.images.count;
    if (count > kPicCount) {
        count = kPicCount;
    }
    return count;
}
- (void)setImages:(NSArray *)images {
    _images = images;
    for (int i = 0; i < kPicCount; i++)
    {
        UIImageView *imgView = self.subviews[i];
        if(i < _images.count)
        {
            imgView.image = [UIImage imageNamed:_images[i]];
            imgView.hidden = NO;
        }
        else
        {
            imgView.hidden = YES;
        }
    }
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
     CGRect rect = self.frame;
    NSUInteger count = [self picCount];
    if (count == 1)
    {
        UIImageView *imgView = self.subviews[0];
        imgView.frame = (CGRect){{kMargin, kMargin},{kWidth - 2*kMargin,kWidth - 2*kMargin}};
        rect.size.height = CGRectGetMaxY(imgView.frame) + kMargin;
    }
    else if (count == 0)
    {
        rect.size.height = 0;
    }
    else if (count == 2 || count == 4)
    {
        CGFloat pWidth = (kWidth - 3*kMargin)/2;
        CGFloat width = pWidth + kMargin;
        for (int i =0; i < count; i++) {
            CGFloat x = i%2*width + kMargin;
            CGFloat y = i/2*width + kMargin;
            UIImageView *imgView = self.subviews[i];
            imgView.frame = CGRectMake(x, y, pWidth, pWidth);
            rect.size.height = y + width + kMargin;
        }
    }
    else
    {
        CGFloat pWidth = (kWidth - 4*kMargin)/3;
        CGFloat width = pWidth + kMargin;
        for (int i =0; i < count; i++)
        {
            CGFloat x = i%3*width + kMargin;
            CGFloat y = i/3*width + kMargin;
            UIImageView *imgView = self.subviews[i];
            imgView.frame = CGRectMake(x, y, pWidth, pWidth);
            rect.size.height = y + width + kMargin;
        }
    }
    rect.size.width = kWidth;
    self.frame = rect;
}

@end
