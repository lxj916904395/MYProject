//
// Created by 梁显杰 on 2018/1/12.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TitleScrollView : UIView
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles contentScrollView:(UIScrollView *)contentScrollView;

@property (copy, nonatomic) void (^showControllerBlock)(NSInteger index);
- (void)begainLoad;

@end
