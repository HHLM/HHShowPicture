//
//  HHModel.h
//  HHShowPictures
//
//  Created by LXH on 2017/2/24.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HHModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, strong) NSArray *images;
+ (CGFloat)heightWithString:(NSString *)string
                       font:(UIFont *)font
         constrainedToWidth:(CGFloat)width;
@end
