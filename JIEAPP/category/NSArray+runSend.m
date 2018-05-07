//
//  NSArray+runSend.m
//  JIEAPP
//
//  Created by 梁显杰 on 2018/5/7.
//  Copyright © 2018年 jie. All rights reserved.
//

#import "NSArray+runSend.h"

#import <objc/runtime.h>

@implementation NSArray (runSend)

void arrayObjectAtIndexedSubscript(id obj, SEL _cmd){
    NSLog(@"数组越界了");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    if (sel == @selector(objectAtIndexedSubscript)) {
        class_addMethod(self.class, sel, (IMP)arrayObjectAtIndexedSubscript, "v@:");
    }
    
    return [super resolveInstanceMethod:sel];
}

@end
