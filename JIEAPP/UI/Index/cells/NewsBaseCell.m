//
// Created by 梁显杰 on 2018/1/18.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "NewsBaseCell.h"


@implementation NewsBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryNone;

        [self.contentView addSubview:self.imgIcon];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.descLabel];
        [self.contentView addSubview:self.sourceLabel];
        [self.contentView addSubview:self.sourceHeadView];
        [self.contentView addSubview:self.imgOther1];
        [self.contentView addSubview:self.imgOther2];
        [self.contentView addSubview:self.playBtn];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.scanLabel];
        [self.contentView addSubview:self.bottomLine];
        
        //rself.contentView.backgroundColor = kRandomColor;

    }
    return self;
}

- (UILabel *)titleLabel {

    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = kFont19;
        _titleLabel.numberOfLines = 3;
    }
    return _titleLabel;
}

- (UILabel *)descLabel{

    if (!_descLabel) {
        _descLabel = [[UILabel alloc] init];
        _descLabel.textColor = [UIColor grayColor];
        _descLabel.font = kFont13;
        _descLabel.numberOfLines = 3;
    }
    return _descLabel;
}


- (UILabel *)sourceLabel {
    if (!_sourceLabel) {
        _sourceLabel = [[UILabel alloc] init];
        _sourceLabel.textColor = [UIColor grayColor];
        _sourceLabel.font = kFont10;
    }
    return _sourceLabel;
}

- (UILabel *)timeLabel {

    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = [UIColor blackColor];
        _timeLabel.font = kFont10;
    }
    return _timeLabel;
}

- (UILabel *)scanLabel{

    if (!_scanLabel) {
        _scanLabel = [[UILabel alloc] init];
        _scanLabel.textColor = [UIColor blackColor];
        _scanLabel.font = kFont10;
    }
    return _scanLabel;
}

- (UIImageView *)imgIcon{

    if (!_imgIcon) {
        _imgIcon = [[UIImageView alloc] init];
        _imgIcon.contentMode = UIViewContentModeScaleAspectFill;
        _imgIcon.clipsToBounds = YES;
    }
    return _imgIcon;
}

- (UIImageView *)imgOther1{

    if (!_imgOther1) {
        _imgOther1 = [[UIImageView alloc] init];
        _imgOther1.contentMode = UIViewContentModeScaleAspectFill;
        _imgOther1.clipsToBounds = YES;

    }
    return _imgOther1;
}

- (UIImageView *)imgOther2{
    if (!_imgOther2) {
        _imgOther2 = [[UIImageView alloc] init];
        _imgOther2.contentMode = UIViewContentModeScaleAspectFill;
        _imgOther2.clipsToBounds = YES;

    }
    return _imgOther2;
}

- (UIButton *)playBtn{

    if (!_playBtn) {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setImage:[UIImage imageNamed:@"icon_play"] forState:UIControlStateNormal];
        _playBtn.backgroundColor = [UIColor lightGrayColor];
        _playBtn.layer.masksToBounds = YES;
        _playBtn.userInteractionEnabled = NO;
    }
    return _playBtn;
}

- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor lightGrayColor];
        _bottomLine.alpha = 0.7;
    }
    return _bottomLine;
}

- (UIImageView *)sourceHeadView{
    if (!_sourceHeadView) {
        _sourceHeadView = [[UIImageView alloc] init];
        _sourceHeadView.layer.masksToBounds = YES;
        _sourceHeadView.contentMode = UIViewContentModeScaleAspectFill;
        _sourceHeadView.layer.masksToBounds = YES;
    }
    return _sourceHeadView;
}

+ (NSString *)cellReuseIdentifier{
    return NSStringFromClass([self class]);
}

- (void)setImage:(NSString *)url imageView:(UIImageView *)uiImageView{


    [uiImageView sd_setImageWithURL:[NSURL URLWithString:url]
                    placeholderImage:kNewsDefaultBigImage
                           completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error ) {
            [self downloadImage:url imageView:uiImageView];
        }
    }];

}

-(void)downloadImage:(NSString *)url imageView:(UIImageView *)imgView{

    //以便在block中使用
    __block UIImage *image = [[UIImage alloc] init];
    //图片下载链接
    NSURL *imageDownloadURL = [NSURL URLWithString:url];

    //将图片下载在异步线程进行
    //创建异步线程执行队列
    dispatch_queue_t asynchronousQueue = dispatch_queue_create("imageDownloadQueue", NULL);
    //创建异步线程
    dispatch_async(asynchronousQueue, ^{
        //网络下载图片  NSData格式
        NSError *error;
        NSData *imageData = [NSData dataWithContentsOfURL:imageDownloadURL options:NSDataReadingMappedIfSafe error:&error];
        if (imageData) {
            image = [UIImage imageWithData:imageData];
        }
        //回到主线程更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if(image)
                [imgView setImage:image];
        });
    });
}

- (void)cellConfig:(NewsInfo *)info {
    self.titleLabel.text = info.title;
    [self setImage:info.imgsrc imageView:self.imgIcon];
    
    self.sourceLabel.text = info.source_name;
}



@end
