//
//  HttpRespondse.m
//  JIEAPP
//
//  Created by 梁显杰 on 2018/1/15.
//  Copyright © 2018年 jie. All rights reserved.
//

#import "HttpRespondse.h"


@implementation HttpRespondse

+ (HttpRespondse *)respondseByObject:(id)object {
    HttpRespondse *respondse = [[HttpRespondse alloc] init];
    if (object != nil && [object isKindOfClass:[NSDictionary class]]){
        [respondse setValuesForKeysWithDictionary:object];
    }
    return respondse;
}


@end
