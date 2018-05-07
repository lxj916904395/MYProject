//
// Created by 梁显杰 on 2018/1/11.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <objc/runtime.h>
#import "BaseBean.h"


@implementation BaseBean

- (void)setValue:(nullable id)value forKey:(NSString *)key {

    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (id)valueForUndefinedKey:(NSString *)key{
    return key;
}



+ (LKDBHelper *)instanceDBHelper{

    static LKDBHelper *lkdbHelper;

    static dispatch_once_t once;

    dispatch_once(&once, ^{

        NSString* dbpath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"jieapp.db"];
        lkdbHelper = [[LKDBHelper alloc] initWithDBPath:dbpath];

        //数据库路径
        setDataUserDefaults(@"db_cache_path", dbpath);
    });

    return lkdbHelper;
}

- (NSDictionary *)keyValueFromBean {
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i< outCount; i++)
    {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) [props setObject:propertyValue forKey:propertyName];
    }
    free(properties);
    return props;
}

+ (BOOL)inserBean:(id)bean {
    return [[BaseBean instanceDBHelper] insertToDB:bean];
}

+ (BOOL)updateBean:(id)bean where:(NSString *)where{
    return [[BaseBean instanceDBHelper] updateToDB:bean where:where];
}

+ (BOOL)deleteBean:(id)bean {
    return [[BaseBean instanceDBHelper] deleteToDB:bean];
}

+ (void)dropTable:(Class)lclass {

    if ([self existClass:lclass]){
        [[BaseBean instanceDBHelper] dropTableWithClass:lclass];
    }
}
+ (BOOL)existClass:(Class)lclass{
    return [[BaseBean instanceDBHelper] isExistsClass:lclass where:nil];
}

@end
