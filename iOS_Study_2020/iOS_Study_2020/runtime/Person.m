//
//  Person.m
//  iOS_Study_2020
//
//  Created by ss on 2020/12/31.
//

#import "Person.h"
#import "SpareWheel.h"
#import <objc/runtime.h>

@implementation Person

void sendMessage(id self, SEL _cmd, NSString *msg){
    NSLog(@"send_msg = %@", msg);
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSString *methonNameStr = NSStringFromSelector(sel);
//    if ([methonNameStr isEqualToString:@"sendMessage:"]) {
//        return class_addMethod(self, sel, (IMP)sendMessage, @"v@:@");
//    }
//    return NO;
//}

/// 快速消息转发
/// @param aSelector aSelector description
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSString *methonNameStr = NSStringFromSelector(aSelector);
//    if ([methonNameStr isEqualToString:@"sendMessage:"]) {
//        return [SpareWheel new];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}



/// 消息方法签名
/// @param aSelector aSelector description
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *methonNameStr = NSStringFromSelector(aSelector);
    if ([methonNameStr isEqualToString:@"sendMessage:"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

/// 慢速转发
/// @param anInvocation anInvocation description
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL sel = [anInvocation selector];
    SpareWheel *sp = [SpareWheel new];
    if ([sp respondsToSelector:sel]) {
        [anInvocation invokeWithTarget:sp];
    } else {
        [super forwardInvocation:anInvocation];
    }
}

- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"找不到方法 %@",NSStringFromSelector(aSelector));
}

@end
