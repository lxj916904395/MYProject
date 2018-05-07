//
//  HttpRespondse.h
//  JIEAPP
//
//  Created by 梁显杰 on 2018/1/15.
//  Copyright © 2018年 jie. All rights reserved.
//

#import "BaseBean.h"


@interface HttpRespondse : BaseBean

@property (assign ,nonatomic) long status;
@property (assign,nonatomic) id data;
@property (strong ,nonatomic) NSString *message;


+ (HttpRespondse *)respondseByObject:(id)object;
@end
