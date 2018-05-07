//
// Created by 梁显杰 on 2018/1/15.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "HttpManager.h"

#import "KeychainIDFA.h"

#define loadParams(parames) [[HttpManager instance] getAppParams:parames]
#define setSuccess successBlock([HttpRespondse respondseByObject:responseObject])
#define setError errorBlock(error)


@implementation HttpManager

+ (HttpManager *)instance {

    static HttpManager *manager = nil;
    static dispatch_once_t pre;

    dispatch_once(&pre, ^{

        NSURL *url = [NSURL URLWithString:BaseURL];

        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];

        manager = [[self alloc] initWithBaseURL:url sessionConfiguration:configuration];

        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/json", @"text/plain", nil];
        manager.requestSerializer.timeoutInterval = 20;
        
    });

    return manager;
}

- (NSMutableDictionary *)getAppParams:(NSMutableDictionary *)params {

    if (params == nil)
        params = [NSMutableDictionary dictionary];


    params[@"utdid"] = [KeychainIDFA IDFA];
    params[@"ver"] = appVersion;
    params[@"app_name"] = AppDisplayName;
    params[@"device_name"] = CurrentDevice;
    params[@"app"] = @"ios-app";
    params[@"system_name"] = SystemName;
    params[@"fr"] = CurrentModel;
    params[@"lang"] = CurrentLang;
    params[@"nw"] = [Tools getNetWorking];
    params[@"wifi"] = [Tools getWifiName];
    params[@"ts"] = [NSString stringWithFormat:@"%ld", time(NULL)];
    params[@"entry"] = @"";
    params[@"entry1"] = @"";
    params[@"entry2"] = @"";
    params[@"market"] = @"appstore";
    params[@"loginType"] = @"def";
    return params;
}


#pragma mark =========== app配置

+ (void)onRegister:(NSMutableDictionary *)parames
           success:(httpSuccessBlock)successBlock
             error:(httpFailBlock)errorBlock {
    NSString *url = @"api/v1/register";

    [[HttpManager instance] GET:url parameters:loadParams(parames)
                       progress:^(NSProgress *downloadProgress) {

                       } success:^(NSURLSessionDataTask *task, id responseObject) {

                setSuccess;
            }           failure:^(NSURLSessionDataTask *task, NSError *error) {

                setError;
            }];


}

#pragma mark =========== 新闻频道

+ (void)newChannels:(NSMutableDictionary *)parameters
            success:(httpSuccessBlock)successBlock {

    NSString *url = @"api/v1/channels";

    [[HttpManager instance] GET:url parameters:loadParams(parameters) progress:^(NSProgress *_Nonnull downloadProgress) {

    }                   success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        setSuccess;

    }                   failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {

    }];
}


#pragma mark =========== 选车频道

+ (void)CarList:(NSMutableDictionary *)parameters
       successs:(httpSuccessBlock)successBlock
          error:(httpFailBlock)errorBlock {

    NSString *url = @"api/v2/findcar";

    [[HttpManager instance] GET:url parameters:loadParams(parameters) progress:^(NSProgress *_Nonnull uploadProgress) {

    }                   success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        setSuccess;
    }                   failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        setError;
    }];
}

#pragma mark =========== 报价类型

+ (void)quoteChannels:(NSMutableDictionary *)parames
              success:(httpSuccessBlock)successBlock
              failure:(httpFailBlock)errorBlock {

    NSString *url = @"api/v1/brand_level";
    [[HttpManager instance] GET:url parameters:loadParams(parames) progress:^(NSProgress *_Nonnull uploadProgress) {

    }                   success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        setSuccess;
    }                   failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        setError;
    }];
}

+ (void)newsArticles:(id)parameters
             success:(httpSuccessBlock)successBlock
               error:(httpFailBlock)errorBlock {

    NSString *url = @"api/v2/article";

    [[HttpManager instance] GET:url parameters:loadParams(parameters) progress:^(NSProgress *_Nonnull downloadProgress) {

    }                   success:^(NSURLSessionDataTask *task, id responseObject) {

        setSuccess;

    }                   failure:^(NSURLSessionDataTask *task, NSError *error) {

        setError;
    }];

}

@end
