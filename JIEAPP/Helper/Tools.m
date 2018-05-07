//
// Created by 梁显杰 on 2018/1/15.
// Copyright (c) 2018 jie. All rights reserved.
//

#import "Tools.h"

#import <SystemConfiguration/CaptiveNetwork.h>

@implementation Tools

#pragma mark ============= 网络
+ (NSString *)getNetWorking {
    // 状态栏是由当前app控制的，首先获取当前app
    UIApplication *app = [UIApplication sharedApplication];

    NSArray *children = [[[app valueForKeyPath:@"statusBar"] valueForKeyPath:@"foregroundView"] subviews];

    int type = 0;
    for (id child in children) {
        if ([child isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            type = [[child valueForKeyPath:@"dataNetworkType"] intValue];
        }
    }

    NSString *stateString = nil;

    switch (type) {
        case 0:
            stateString = @"notReachable";
            break;

        case 1:
            stateString = @"2G";
            break;

        case 2:
            stateString = @"3G";
            break;

        case 3:
            stateString = @"4G";
            break;

        case 4:
            stateString = @"LTE";
            break;

        case 5:
            stateString = @"wifi";
            break;

        default:
            break;
    }

    return stateString;
}

+ (NSString *)getWifiName
{
    NSString *wifiName = @"";
    CFArrayRef wifiInterfaces = CNCopySupportedInterfaces();
    if (!wifiInterfaces) {
        return wifiName;
    }

    NSArray *interfaces = (__bridge NSArray *)wifiInterfaces;
    for (NSString *interfaceName in interfaces) {
        CFDictionaryRef dictRef = CNCopyCurrentNetworkInfo((__bridge CFStringRef)(interfaceName));
        if (dictRef) {
            NSDictionary *networkInfo = (__bridge NSDictionary *)dictRef;
            NSLog(@"network info -> %@", networkInfo);
            wifiName = [networkInfo objectForKey:(__bridge NSString *)kCNNetworkInfoKeySSID];
            CFRelease(dictRef);
        }
    }
    CFRelease(wifiInterfaces);
    return wifiName;
}


@end