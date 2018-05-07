//
// Created by 梁显杰 on 2018/1/17.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "QuoteChannelInfo.h"


@implementation QuoteChannelInfo

+ (void)save:(NSArray *)array{

    if(array.count<=0)
        return;

    [self deleteAll];

    for (NSDictionary *obj in array) {
        QuoteChannelInfo *info = [[QuoteChannelInfo alloc] init];
        [info setValuesForKeysWithDictionary:obj];
        BOOL result = [info saveToDB];
        if (result) {
            
        }
    }
}

+ (void)deleteAll{
    [super dropTable:[self class]];
}



@end
