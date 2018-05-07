//
// Created by 梁显杰 on 2018/1/12.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ChannelInfo : BaseBean
@property (nonatomic,strong) NSString *cTime;
@property (nonatomic,strong) NSString *keys;
@property (nonatomic,strong) NSString *pid;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *uTime;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *cid;

@property (nonatomic,assign) int curPage;
@property (nonatomic,assign) int itemsPerPage;
@property (nonatomic,assign) int pos;
@property (nonatomic,assign) int ready_state;


+ (NSArray *)findAll;
+ (void)savaDatas:(NSArray *)array;

@end