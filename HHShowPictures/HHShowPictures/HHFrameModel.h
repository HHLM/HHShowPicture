//
//  HHFrameModel.h
//  HHShowPictures
//
//  Created by LXH on 2017/2/24.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHModel.h"
#import <UIKit/UIKit.h>
@interface HHFrameModel : NSObject
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGRect labRect;
@property (nonatomic, assign) CGRect picRect;
@property (nonatomic, strong) HHModel *model;
@end
