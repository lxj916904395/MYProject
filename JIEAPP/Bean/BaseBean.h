//
// Created by 梁显杰 on 2018/1/11.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <LKDBHelper/LKDBHelper.h>

@interface BaseBean : NSObject

+ (LKDBHelper *)instanceDBHelper;

- (NSDictionary *)keyValueFromBean;

+ (BOOL)inserBean:(id)bean;
+ (BOOL)updateBean:(id)bean where:(NSString *)where;
+ (BOOL)deleteBean:(id)bean;

+ (void)dropTable:(Class)lclass;
+ (BOOL)existClass:(Class)lclass;

@end
