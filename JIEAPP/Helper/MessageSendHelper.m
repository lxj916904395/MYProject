//
//  MessageSendHelper.m
//  JIEAPP
//
//  Created by 梁显杰 on 2018/5/6.
//  Copyright © 2018年 jie. All rights reserved.
//

#import "MessageSendHelper.h"

@implementation MessageSendHelper
- (void)headerTap{
    
    [SVProgressHUD showWithStatus:@"点击了头像"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

@end
