//
// Created by 梁显杰 on 2018/1/17.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "NewsInfo.h"


@implementation NewsInfo

+ (void)save:(NSArray *)array cid:(NSString *)cid{
    if (array == nil || array.count==0)
        return;

    [self delete:cid];

    for (NewsInfo *info in array){
        info.lcid = cid;
        [info saveToDB];
    }

}


+ (void)delete:(NSString *)cid{
    if ([super existClass:[self class]]) {
        [[BaseBean instanceDBHelper] deleteWithClass:[NewsInfo class] where:[NSString stringWithFormat:@"cid='%@'",cid]];
    }
}

@end
