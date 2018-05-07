//
// Created by 梁显杰 on 2018/1/11.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "UserDefaultHelper.h"

static NSUserDefaults * defaults = nil;
static UserDefaultHelper * helper = nil;

@implementation UserDefaultHelper

+ (UserDefaultHelper *)instance{

    static dispatch_once_t once;

    dispatch_once(&once, ^{

        helper = [[self alloc] init];
        defaults = [NSUserDefaults standardUserDefaults];
    });

    return helper;
}

- (void)writeData:(id)object forKey:(NSString *)key {

    if(object!=nil && !isEmptyString(key)){
        [defaults setValue:object forKey:key];
    }
}

- (id)getDataForKey:(NSString *)key {

    return isEmptyString(key) == NO ? [defaults objectForKey:key]:nil;

}

- (void)removeDataForKey:(NSString *)key {
    if (!isEmptyString(key))[defaults removeObjectForKey:key];
}


@end