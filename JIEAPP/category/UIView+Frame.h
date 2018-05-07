//
// Created by 梁显杰 on 2018/1/12.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat  x;
@property (nonatomic, assign) CGFloat  y;
@property (nonatomic, assign) CGFloat  width;
@property (nonatomic, assign) CGFloat  height;

@property (nonatomic, assign) CGSize  size;

- (void)setSize:(CGSize)size;
- (void)setOrigin:(CGPoint)point;
- (void)setCenterY:(CGFloat)centerY;
- (void)setCenterX:(CGFloat)centerX;

@end
