//
//  HHModel.m
//  HHShowPictures
//
//  Created by LXH on 2017/2/24.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HHModel.h"

@implementation HHModel

#pragma mark --计算Lable高度
+ (CGFloat)heightWithString:(NSString *)string
                       font:(UIFont *)font
         constrainedToWidth:(CGFloat)width
{
    CGSize rtSize;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    rtSize = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return ceil(rtSize.height) + 0.5;
}

@end
