//
// Created by 梁显杰 on 2018/1/11.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <Foundation/Foundation.h>

#define setDataUserDefaults(object,key) [[UserDefaultHelper instance] writeData:object forKey:key]
#define getDataUserDefaults(key) [[UserDefaultHelper instance] getDataForKey:key]
#define removeDataUserDefaults [[UserDefaultHelper instance] removeDataForKey:key]

@interface UserDefaultHelper : NSObject


+ (UserDefaultHelper *)instance;

- (void)writeData:(id)object forKey:(NSString *)key;
- (id)getDataForKey:(NSString *)key;
- (void)removeDataForKey:(NSString *)key;

@end
