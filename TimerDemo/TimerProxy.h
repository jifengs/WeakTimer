//
//  TimerProxy.h
//  TimerDemo
//
//  Created by Ji Feng on 2019/8/5.
//  Copyright © 2019 Ji Feng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimerProxy : NSProxy

@property (nonatomic, weak) id weakTarget;

- (instancetype)initWithTarget:(id)target;
+ (instancetype)proxyWithTarget:(id)target;

@end

NS_ASSUME_NONNULL_END
