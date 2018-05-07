//
//  UIViewController+MessageSend.m
//  JIEAPP
//
//  Created by 梁显杰 on 2018/5/6.
//  Copyright © 2018年 jie. All rights reserved.
//

#import "UIViewController+MessageSend.h"
#import <objc/runtime.h>
#import "MessageSendHelper.h"

@implementation UIViewController (MessageSend)

void tapMethod(id obj, SEL _cmd){
    NSLog(@"接收到未实现的方法 %@",NSStringFromSelector(_cmd));
}

/**
 动态方法解析
 
 @param sel 处理的方法
 @return YES
 */
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//
//    if(sel == @selector(headerTap)){
//        //v :返回类型void
//        //@ :seld的类型id
//        //: :_cmd的类型SEL
//        class_addMethod([self class], sel, (IMP)tapMethod, "v@:");
//    }
//    return [super resolveInstanceMethod:sel];
//}


/**
 快速转发

 @param aSelector 处理的方法
 @return 返回类型
 */
//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    if(aSelector == @selector(headerTap)){
//        return [[MessageSendHelper alloc] init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}


/**
 消息转发
1. 方法就是一个不能识别消息的分发中心，将这些不能识别的消息转发给不同的消息对象，或者转发给同一个对象，再或者将消息翻译成另外的消息，亦或者简单的“吃掉”某些消息，因此没有响应也不会报错。例如：我们可以为了避免直接闪退，可以当消息没法处理时在这个方法中给用户一个提示，也不失为一种友好的用户体验。
2.参数invocation是从哪来的？在forwardInvocation:消息发送前，runtime系统会向对象发送methodSignatureForSelector:消息，并取到返回的方法签名用于生成NSInvocation对象。所以重写forwardInvocation:的同时也要重写methodSignatureForSelector:方法，否则会抛出异常。当一个对象由于没有相应的方法实现而无法响应某个消息时，运行时系统将通过forwardInvocation:消息通知该对象。每个对象都继承了forwardInvocation:方法，我们可以将消息转发给其它的对象。
 @param anInvocation 签名方法
 */
- (void)forwardInvocation:(NSInvocation *)invocation{
    NSLog(@"未处理方法 %@",NSStringFromSelector(invocation.selector));
}


/**
 方法签名

 @param aSelector 需要处理的方法
 @return 返回值
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    //方法签名
    return [NSMethodSignature signatureWithObjCTypes:"v@:@"];


}

@end
