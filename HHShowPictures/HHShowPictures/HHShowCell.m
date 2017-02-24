//
//  HHShowCell.m
//  HHShowPictures
//
//  Created by LXH on 2017/2/23.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "HHShowCell.h"
#import "HHTool.h"
@interface HHShowCell ()
{
    NSArray *images;
}
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) ShowPictureView *picView;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *timeLab;
@property (nonatomic, strong) UILabel *message;
@property (nonatomic, strong) UIButton *zanBtn;
@property (nonatomic, strong) UIButton *shareBtn;
@property (nonatomic, strong) UIButton *talkBtn;

@end

#define kWidth ([UIScreen mainScreen].bounds.size.width)

@implementation HHShowCell

- (void)showmePictureView:(ShowPictureView *)picView index:(NSInteger)index
{
    [HHTool showImageViews:picView.subviews imageURLs:images atIndex:index];
}
+ (instancetype)creatCellWithTableView:(UITableView *)tableView {
    HHShowCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self)];
    if (!cell) {
        cell = [[HHShowCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self)];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.iconView];
        [self addSubview:self.nameLab];
        [self addSubview:self.timeLab];
        [self addSubview:self.message];
        [self addSubview:self.picView];
    }
    return self;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView =[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        _iconView.layer.cornerRadius = 25;
        _iconView.clipsToBounds = YES;
        _iconView.backgroundColor = [UIColor redColor];

    }
    return _iconView;
}
- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab =[[UILabel alloc] initWithFrame:CGRectMake(80, 30, 100, 20)];
        _nameLab.text = @"小但丁";
    }return _nameLab;
}
- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab =[[UILabel alloc] initWithFrame:CGRectMake(kWidth - 100, 30, 80, 20)];
        _timeLab.textAlignment = NSTextAlignmentRight;
        _timeLab.text = @"10分钟前";
    }return _timeLab;
}

- (UILabel *)message {
    if (!_message) {
        _message =[[UILabel alloc] initWithFrame:CGRectMake(10, 70, kWidth - 20, 20)];
        _message.numberOfLines = 0;
        _message.text = @"10分钟前";
    }return _message;
}
- (ShowPictureView *)picView {
    if (!_picView) {
        _picView = [[ShowPictureView alloc] initWithFrame:CGRectMake(0, 100, kWidth, 0)];
        _picView.delegate = self;
    }
    return _picView;
}
- (void)refershCell:(HHModel *)model
{
    images = model.images;
    self.picView.images = model.images;
    self.iconView.image = [UIImage imageNamed:model.icon];
    self.timeLab.text = model.time;
    self.nameLab.text = model.name;
    self.message.text = model.content;
    [self layoutIfNeeded];
}
- (void)layoutSubviews
{
    CGRect labRect = self.message.frame;
    labRect.size.height = [HHModel heightWithString:self.message.text font:self.message.font constrainedToWidth:labRect.size.width];
    self.message.frame = labRect;
    CGRect rect = self.picView.frame;
    rect.origin.y = CGRectGetMaxY(self.message.frame);
    self.picView.frame = rect;
}
- (CGFloat)cellHeigth {
    [self layoutSubviews];
    return CGRectGetMaxY(self.picView.frame)+10;
}
- (CGSize)sizeOfTextWithUILabel:(UILabel *)label
{
    return [label.text boundingRectWithSize:label.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size;
}
@end
