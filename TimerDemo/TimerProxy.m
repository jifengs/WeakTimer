//
//  TimerProxy.m
//  TimerDemo
//
//  Created by Ji Feng on 2019/8/5.
//  Copyright © 2019 Ji Feng. All rights reserved.
//

#import "TimerProxy.h"

@implementation TimerProxy

- (instancetype)initWithTarget:(id)target {
    _weakTarget = target;
    return self;
}

+ (instancetype)proxyWithTarget:(id)target {
    return [[self alloc] initWithTarget:target];
}

//返回方法的签名。
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.weakTarget methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL sel = [invocation selector];
    if ([self.weakTarget respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.weakTarget];
    }
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [self.weakTarget respondsToSelector:aSelector];
}

@end
