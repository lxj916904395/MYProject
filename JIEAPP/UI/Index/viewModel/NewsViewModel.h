//
// Created by 梁显杰 on 2018/1/17.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NewsInfo.h"

typedef NS_ENUM(NSInteger,NewsDataType){
    NewsDataTypeNew = 0,
    NewsDataTypeOld
};

@interface NewsViewModel : NSObject

@property (strong , nonatomic) RACCommand *command;
@property (strong , nonatomic) NSString *cid;
@property (strong , nonatomic) NSMutableArray *datas;
@property (assign , nonatomic) NewsDataType dataType;

- (instancetype)initWithCid:(NSString *)cid;

@end