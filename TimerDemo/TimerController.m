//
//  TimerController.m
//  TimerDemo
//
//  Created by Ji Feng on 2019/8/5.
//  Copyright © 2019 Ji Feng. All rights reserved.
//

#import "TimerController.h"
#import "TimerTarget.h"
#import "TimerProxy.h"
#import "NSTimer+WeakTimer.h"

@interface TimerController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) dispatch_source_t aTimer;

@end

@implementation TimerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 100, self.view.frame.size.width - 40, 40);
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"倒计时" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonAction {
    //方法一：类方法
//    self.timer = [TimerTarget scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeFire) userInfo:nil repeats:YES];
    
    //方法二：WeakProxy
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:[TimerProxy proxyWithTarget:self] selector:@selector(timeFire) userInfo:nil repeats:YES];
//    [self.timer setFireDate:[NSDate distantPast]];
    
    //方法三：用GCD的定时器替换
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    self.aTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    dispatch_source_set_timer(_aTimer, dispatch_time(DISPATCH_TIME_NOW, 0), 2 * NSEC_PER_SEC, 0);
//    dispatch_source_set_event_handler(_aTimer, ^{
//        NSLog(@"%@", [NSThread currentThread]);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"开始计时");
//        });
//    });
//    //开启计时器
//    dispatch_resume(_aTimer);
//
//    //结束计时
//    //dispatch_source_cancel(_aTimer);
    
    //方法四：使用block
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer jf_scheduledTimerWithTimeInterval:2 block:^{
        [weakSelf timeFire];
    } repeats:YES];
}

- (void)timeFire {
    NSLog(@"开始计时");
}

- (void)dealloc {
    [self.timer invalidate];
    printf(__func__);
}


@end
