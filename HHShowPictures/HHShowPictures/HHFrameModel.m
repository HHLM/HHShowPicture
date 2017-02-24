//
//  HHFrameModel.m
//  HHShowPictures
//
//  Created by LXH on 2017/2/24.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HHFrameModel.h"

#define kWidth ([UIScreen mainScreen].bounds.size.width)
static const NSUInteger kPicCount = 9; //最多展示的图片
static const CGFloat  kMargin = 10;

@implementation HHFrameModel

- (void)setModel:(HHModel *)model {
 
    CGFloat heigth = [HHModel heightWithString:model.content font:[UIFont systemFontOfSize:17] constrainedToWidth:kWidth - 2*kMargin];
    
    self.labRect = CGRectMake(kMargin, 70,kWidth - 2*kMargin, heigth);
    
    NSUInteger count = model.images.count;
    if (count > kPicCount) {
        count = kPicCount;
    }
    if (count == 1)
    {
        _picRect = (CGRect){{kMargin, kMargin+CGRectGetMaxY(_labRect)},{kWidth ,kWidth}};
    }
    else if (count == 0)
    {
        _picRect = (CGRect){{kMargin, kMargin},{0 ,0}};
    }
    else if (count == 2 || count == 4)
    {
         _picRect = (CGRect){{kMargin, kMargin+CGRectGetMaxY(_labRect)},{kWidth ,kWidth/2 * (count/2)}};
    }
    else
    {
        _picRect = (CGRect){{kMargin, kMargin+CGRectGetMaxY(_labRect)},{kWidth ,kWidth/3 * count/3 + count%3?kWidth/3:0}};
    }
    _cellHeight = CGRectGetMaxY(_picRect) + kMargin;
}

@end
