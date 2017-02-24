//
//  HHTool.m
//  HHShowPictures
//
//  Created by LXH on 2017/2/24.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HHTool.h"
#import <MJPhotoBrowser.h>
@implementation HHTool
+ (void)showImageViews:(NSArray *)showViews imageURLs:(NSArray *)imageURLs atIndex:(NSInteger)index
{
    // 1.创建图片浏览器
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    
    // 2.设置图片浏览器显示的所有图片
    NSMutableArray *photos = [NSMutableArray array];
    NSUInteger count = imageURLs.count;
    for (int i = 0; i<count; i++) {
        
        MJPhoto *photo = [[MJPhoto alloc] init];
        // 设置图片的路径
        //        photo.image = [UIImage imageNamed:@"xinwen_moren"];
        photo.url = [NSURL URLWithString:imageURLs[i]];
        photo.image = [UIImage imageNamed:imageURLs[i]];
        
        // 设置来源于哪一个UIImageView
        
        if (showViews.count==1) {
            photo.srcImageView = showViews[0];
        }
        else {
            photo.srcImageView = showViews[i];
        }
        [photos addObject:photo];
    }
    browser.photos = photos;
    
    // 3.设置默认显示的图片索引
    browser.currentPhotoIndex = index;
    
    // 3.显示浏览器
    [browser show];
}
@end
