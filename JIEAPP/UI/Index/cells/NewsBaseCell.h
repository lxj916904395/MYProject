//
// Created by 梁显杰 on 2018/1/18.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewsInfo.h"

@interface NewsBaseCell : UITableViewCell

/**
 *  图片
 */
@property (strong, nonatomic) UIImageView *imgIcon;
/**
 *  标题
 */
@property (strong, nonatomic) UILabel *titleLabel;

//描述
@property (strong, nonatomic) UILabel *descLabel;


/**
 *  来源
 */
@property (strong, nonatomic) UILabel *sourceLabel;
@property (strong, nonatomic) UIImageView *sourceHeadView;//来源图标


/**
 *  时间
 */
@property (strong, nonatomic) UILabel *timeLabel;

//浏览数
@property (strong, nonatomic) UILabel *scanLabel;


/**
 *  回复数
 */
@property (strong, nonatomic) UILabel *replyLabel;
/**
 *  第二张图片（如果有的话）
 */
@property (strong, nonatomic) UIImageView *imgOther1;
/**
 *  第三张图片（如果有的话）
 */
@property (strong, nonatomic) UIImageView *imgOther2;

@property (strong, nonatomic) UIButton *playBtn;

@property (strong, nonatomic) UIView *bottomLine;

- (void)cellConfig:(NewsInfo *)info;
+ (NSString *)cellReuseIdentifier;

- (void)setImage:(NSString *)url imageView:(UIImageView *)uiImageView;

@end