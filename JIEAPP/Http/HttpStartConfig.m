//
// Created by 梁显杰 on 2018/1/15.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "HttpStartConfig.h"

#import "RegisterInfo.h"
#import "ChannelInfo.h"
#import "CarChannelInfo.h"
#import "QuoteChannelInfo.h"

@implementation HttpStartConfig

+ (void)onRegister{

    [HttpManager onRegister:nil success:^(HttpRespondse *response) {
        if (responseSuccess(response)){

            if (response.data!=nil && [response.data isKindOfClass:[NSArray class]]){

                NSMutableArray *array = [NSMutableArray array];
                for(NSDictionary *dictionary in response.data){
                    RegisterInfo *registerInfo = [[RegisterInfo alloc] init];
                    [registerInfo setValuesForKeysWithDictionary:dictionary];
                    [array addObject:registerInfo];
                }

                [self versionHandle:array];
            }

        } else{

        }

    } error:^(NSError *error) {

    }];
}

+(void)versionHandle:(NSArray *)array{
    [array enumerateObjectsUsingBlock:^(RegisterInfo * info, NSUInteger idx, BOOL *stop) {

        RegisterInfo *local = [RegisterInfo findKeyCode:info.keyCode];
        if (local == nil || (local && ![local.keyCode isEqualToString:info.keyCode])){
            [self versionByCode:info lVersion:local!=nil?local.keyValue:@"0"];
        }

    }];
}

+ (void)versionByCode:(RegisterInfo *)info lVersion:(NSString *)lVersion{

    if ([info.keyCode isEqualToString:keyCode_skin]) { //tabbar数据



    }else if ([info.keyCode isEqualToString:keyCode_channels]) { //首页频道

        [self loadNewsChannels:lVersion];

    }else if ([info.keyCode isEqualToString:keyCode_category]) {//问答频道


    }else if ([info.keyCode isEqualToString:keyCode_brand]) { //选车

        [self loadCarChannels:lVersion];
    }else if ([info.keyCode isEqualToString:keyCode_SAD_REDU_BAN_V1001]){

        //降价的广告 ,降价的汽车


    }else if ([info.keyCode isEqualToString:keyCode_BRAND_LEVEL_V1001]){
        //降价的汽车类型

        [self loadQuoteChannel:lVersion];
    }else if([info.keyCode isEqualToString:keyCode_SPEC_IMG_V1001]){
        //汽车图片类型

    }
}

//频道列表
+ (void)loadNewsChannels:(NSString *)version {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    dictionary[@"channel_ver"] = version;

    [HttpManager newChannels:dictionary success:^(HttpRespondse *response) {
        if (responseSuccess(response)){
            [ChannelInfo savaDatas:response.data];
        }
    }];
}

/*选车*/
+ (void)loadCarChannels:(NSString *)version {

    NSMutableDictionary *parames = [NSMutableDictionary dictionary];
    parames[@"brand_ver"] = version;

    [HttpManager CarList:parames successs:^(HttpRespondse *response) {

        if(responseSuccess(response) && response.data!=nil){

            NSArray *brandHots = response.data[@"brandHots"];//热门
            NSArray *brandItems = response.data[@"brandItems"];

            [CarChannelInfo saveDatasHots:brandHots defaultData:brandItems];

        }

    } error:^(NSError *error) {

    }];

}

+ (void)loadQuoteChannel:(NSString *)veison{
    NSMutableDictionary *parames = [NSMutableDictionary dictionary];
    parames[@"brand_level_ver"] = veison;

    [HttpManager quoteChannels:parames success:^(HttpRespondse *response) {
        if (responseSuccess(response) && response.data!=nil){

            [QuoteChannelInfo save:response.data];
        }

    } failure:^(NSError *error) {

    }];
}

@end