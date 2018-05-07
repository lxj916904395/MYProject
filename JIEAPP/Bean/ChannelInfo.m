//
// Created by 梁显杰 on 2018/1/12.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "ChannelInfo.h"


@implementation ChannelInfo

+ (NSArray *)findAll{

    NSArray *array = [[BaseBean instanceDBHelper] search:[ChannelInfo class] where:nil orderBy:nil offset:0 count:100];

    if (array == nil|| array.count == 0) {
        NSArray *defaulPlist = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Channels" ofType:@"plist"]];

        NSMutableArray *local = [NSMutableArray array];

        [defaulPlist enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {

            ChannelInfo *model = [[ChannelInfo alloc] init];
            [model setValuesForKeysWithDictionary:obj];
            [local addObject:model];
        }];

        array = local;
    }

    return array;
}

+ (void)savaDatas:(NSArray *)array{
    [self deleteAll];

    [array enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ChannelInfo *model = [[ChannelInfo alloc] init];
        [model setValuesForKeysWithDictionary:obj];
        [model saveToDB];
    }];

}

+ (void)deleteAll{
    [[BaseBean instanceDBHelper] dropTableWithClass:[ChannelInfo class]];
}

@end