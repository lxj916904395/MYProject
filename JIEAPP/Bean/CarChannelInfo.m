//
// Created by 梁显杰 on 2018/1/17.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "CarChannelInfo.h"


@implementation CarChannelInfo



+ (void)deleteAll{
   [super dropTable:[self class]];
}

+ (void)saveDatasHots:(NSArray *)hots defaultData:(NSArray*)defaults{
    [self deleteAll];

    //热门
    for (NSDictionary *dict  in hots) {
        CarChannelInfo *model = [[CarChannelInfo alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [model saveToDB];
    }

    for (int i  = 0; i < defaults.count; i++) {
        NSDictionary *dict = defaults[i];
        CarChannelInfo *model = [[CarChannelInfo alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [model saveToDB];

        if (i == defaults.count-1) {

        }
    }
}


@end
