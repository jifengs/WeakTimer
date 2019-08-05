//
//  TimerTarget.h
//  TimerDemo
//
//  Created by Ji Feng on 2019/8/5.
//  Copyright © 2019 Ji Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimerTarget : NSObject

@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, weak) id target;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval target:(id)target selector:(SEL)selector userInfo:(nullable id)userInfo repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
