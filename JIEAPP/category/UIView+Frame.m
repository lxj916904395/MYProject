//
// Created by 梁显杰 on 2018/1/12.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "UIView+Frame.h"


@implementation UIView (Frame)

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {

    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {

    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {

    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {

    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}

- (void)setOrigin:(CGPoint)point {

    CGRect rect = self.frame;
    rect.origin = point;
    self.frame = rect;
}

-(void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

@end