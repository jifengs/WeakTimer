//
//  ViewController.m
//  TimerDemo
//
//  Created by Ji Feng on 2019/8/5.
//  Copyright © 2019 Ji Feng. All rights reserved.
//

#import "ViewController.h"
#import "TimerController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 100, self.view.frame.size.width - 40, 40);
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonAction {
    TimerController *vc = [[TimerController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
