//
// Created by 梁显杰 on 2018/1/18.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "NewsDefaultCell.h"
#import "UIImageView+WebCache.h"

#define imgW 90

@implementation NewsDefaultCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){

        [self viewLayout];
    }
    return self;
}

- (void)viewLayout{

    self.imgIcon.sd_layout
            .rightSpaceToView(self.contentView,15)
            .topSpaceToView(self.contentView,10)
            .widthIs(90)
            .heightIs(60);

    self.titleLabel.sd_layout
            .leftSpaceToView(self.contentView, 15)
            .topEqualToView(self.imgIcon)
            .rightSpaceToView(self.imgIcon, 15)
            .autoHeightRatio(1);
    [self.titleLabel setMaxNumberOfLinesToShow:3];
    
     self.sourceLabel.sd_layout
    .leftEqualToView(self.titleLabel)
    .bottomEqualToView(self.imgIcon)
    .heightIs(10);
    [self.sourceLabel setSingleLineAutoResizeWithMaxWidth:50];
    
    self.bottomLine.sd_layout
    .leftSpaceToView(self.contentView, 5)
    .rightSpaceToView(self.contentView, 5)
    .topSpaceToView(self.imgIcon, 15)
    .heightIs(1);
    
    [self setupAutoHeightWithBottomView:self.bottomLine bottomMargin:5];

}



@end
