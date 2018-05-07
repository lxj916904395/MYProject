//
// Created by 梁显杰 on 2018/1/17.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <Foundation/Foundation.h>

UIKIT_EXTERN NSString*const keyCode_channels;//首页频道
UIKIT_EXTERN NSString*const keyCode_skin;//tabbar数据
UIKIT_EXTERN NSString*const keyCode_category;//问答频道
UIKIT_EXTERN NSString*const keyCode_brand;//选车列表
UIKIT_EXTERN NSString*const keyCode_splash; //启动广告
UIKIT_EXTERN NSString*const keyCode_pop  ;//主程序广告
UIKIT_EXTERN NSString*const keyCode_ban ;//首页头部

UIKIT_EXTERN NSString*const keyCode_SAD_REDU_BAN_V1001 ;//降价的广告的keyCode
UIKIT_EXTERN NSString*const keyCode_BRAND_LEVEL_V1001;//降价的汽车级别keyCode
UIKIT_EXTERN NSString*const keyCode_SPEC_IMG_V1001;//汽车图片详情顶部类型keyCode

UIKIT_EXTERN NSString*const keyCode_SPEC_DICT_V1001;//汽车比较、配置




@interface RegisterInfo : BaseBean

@property (strong , nonatomic) NSString *keyValue;
@property (strong , nonatomic) NSString *keyName;
@property (strong , nonatomic) NSString *keyCode;
@property (assign , nonatomic) int keyStatus;


+ (RegisterInfo *)findKeyCode:(NSString *)keyCode ;
@end