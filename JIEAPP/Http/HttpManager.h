//
// Created by 梁显杰 on 2018/1/15.
// Copyright (c) 2018 jie. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFHTTPSessionManager.h>


#define  responseSuccess(response) (response.status == HttpResponseTypeSuccess) ? YES : NO


typedef NS_ENUM(NSInteger ,HttpResponseType){

    HttpResponseTypeDefault = 0,
    HttpResponseTypeSuccess = 1,//请求成功
};

typedef void (^httpSuccessBlock)(HttpRespondse *response);
typedef void (^httpFailBlock)(NSError *error);


@interface HttpManager : AFHTTPSessionManager

+ (HttpManager*)instance;

+ (void)onRegister:(NSMutableDictionary *)parames
           success:(httpSuccessBlock)successBlock
             error:(httpFailBlock)errorBlock;

+ (void)newChannels:(NSMutableDictionary *)parameters
            success:(httpSuccessBlock)successBlock;

+ (void)CarList:(NSMutableDictionary *)parameters
       successs:(httpSuccessBlock)successBlock
          error:(httpFailBlock)errorBlock;

+ (void)quoteChannels:(NSMutableDictionary *)parames
              success:(httpSuccessBlock)successBlock
              failure:(httpFailBlock)errorBlock;

+ (void)newsArticles:(id)parameters
             success:(httpSuccessBlock)successBlock
               error:(httpFailBlock)errorBlock;

@end