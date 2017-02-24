//
//  ShowPictureView.h
//  HHShowPictures
//
//  Created by LXH on 2017/2/23.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShowPictureView;

@protocol ShowPictureViewDelegate <NSObject>

@optional
- (void)showmePictureView:(ShowPictureView *)picView index:(NSInteger)index;
@end

@interface ShowPictureView : UIView
@property (nonatomic, weak) id<ShowPictureViewDelegate> delegate;
@property (nonatomic, strong) NSArray *images;

@end
