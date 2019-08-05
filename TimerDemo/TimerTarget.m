//
//  TimerTarget.m
//  TimerDemo
//
//  Created by Ji Feng on 2019/8/5.
//  Copyright © 2019 Ji Feng. All rights reserved.
//

#import "TimerTarget.h"

@implementation TimerTarget

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval target:(id)target selector:(SEL)selector userInfo:(nullable id)userInfo repeats:(BOOL)repeats {
    TimerTarget *timerTarget = [[TimerTarget alloc] init];
    timerTarget.target = target;
    timerTarget.selector = selector;
    timerTarget.timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:timerTarget selector:@selector(timerSelector:) userInfo:userInfo repeats:repeats];
    return timerTarget.timer;
}

- (void)timerSelector:(NSTimer *)timer {
    if (self.target && [self.target respondsToSelector:self.selector]) {
        [self.target performSelector:self.selector withObject:timer.userInfo];
    } else {
        [self.timer invalidate];
    }
}

- (void)dealloc {
    printf(__func__);
}

@end
