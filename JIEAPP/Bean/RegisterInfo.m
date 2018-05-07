//
// Created by 梁显杰 on 2018/1/17.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "RegisterInfo.h"

NSString*const keyCode_channels = @"SCV10001";//首页频道
NSString*const keyCode_skin     = @"SSKV1001";//tabbar数据
NSString*const keyCode_category = @"SCAV1001";//问答频道
NSString*const keyCode_brand    = @"SBRV1001";//选车列表
NSString*const keyCode_splash   = @"SSPR1001"; //启动广告
NSString*const keyCode_pop      = @"SAD_HPOP_V1001";//主程序广告
NSString*const keyCode_ban      = @"SAD_BAN_V1001";//首页头部

NSString*const keyCode_SAD_REDU_BAN_V1001 = @"SAD_REDU_BAN_V1001" ;//降价的广告的keyCode
NSString*const keyCode_BRAND_LEVEL_V1001 = @"BRAND_LEVEL_V1001";//降价的汽车级别keyCode
NSString*const keyCode_SPEC_IMG_V1001 = @"SPEC_IMG_V1001";//汽车图片详情顶部类型keyCode

NSString*const keyCode_SPEC_DICT_V1001 = @"SPEC_DICT_V1001";//汽车比较、配置

@implementation RegisterInfo



+ (RegisterInfo *)findKeyCode:(NSString *)keyCode {

    return [[BaseBean instanceDBHelper] searchSingle:[RegisterInfo class]
                                               where:[NSString stringWithFormat:@"keyCode='%@'",keyCode]
                                             orderBy:nil];
}


@end