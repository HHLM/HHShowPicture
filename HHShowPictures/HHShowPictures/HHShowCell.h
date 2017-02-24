//
//  HHShowCell.h
//  HHShowPictures
//
//  Created by LXH on 2017/2/23.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowPictureView.h"
#import "HHModel.h"
#import "HHFrameModel.h"
@interface HHShowCell : UITableViewCell<ShowPictureViewDelegate>

@property (nonatomic, strong) HHFrameModel *fmodel;;
+ (instancetype)creatCellWithTableView:(UITableView *)tableView;

- (void)refershCell:(HHModel *)model;
- (CGFloat)cellHeigth;
@end
