//
// Created by 梁显杰 on 2018/1/17.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CarChannelInfo : BaseBean

@property (assign ,nonatomic) int brand_code;//

@property (strong ,nonatomic) NSString *bfirst_letter;//
@property (strong ,nonatomic) NSString *brand_name;//车名
@property (strong ,nonatomic) NSString *icon_src;//
@property (assign ,nonatomic) int pid;//
@property (assign ,nonatomic) int pos;//热门品牌排序

+ (void)saveDatasHots:(NSArray *)hots defaultData:(NSArray*)defaults;
@end