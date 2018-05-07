//
// Created by 梁显杰 on 2018/1/17.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QuoteChannelInfo : BaseBean

@property (strong ,nonatomic) NSString *icon;//
@property (strong ,nonatomic) NSString *keyCode;//
@property (strong ,nonatomic) NSString *keyName;//
@property (strong ,nonatomic) NSString *keyValue;//
@property (strong ,nonatomic) NSString *pid;//
@property (assign ,nonatomic) NSInteger pos;//
@property (assign ,nonatomic) NSInteger ready_state;//

+ (void)save:(NSArray *)array;
@end