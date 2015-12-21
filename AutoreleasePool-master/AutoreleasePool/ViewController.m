//
//  ViewController.m
//  AutoreleasePool
//
//  Created by leichunfeng on 15/5/30.
//  Copyright (c) 2015年 leichunfeng. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

__weak NSString *string_weak_ = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 场景 1
//    NSString *string = [NSString stringWithFormat:@"leichunfeng"];//这边创建了两个引用计数
//    string_weak_ = string;
    
//    string_weak_=[NSString stringWithFormat:@"ERICSON"];
    
//    NSString *string=nil;
    // 场景 2
//    @autoreleasepool {
//        string = [NSString stringWithFormat:@"leichunfeng"];
//        string_weak_ = string;
//    }
    
    // 场景 3
    NSString *string = nil;
    @autoreleasepool {
        string = [NSString stringWithFormat:@"leichunfeng"];
        string_weak_ = string;
    }
    
    NSLog(@"viewDidLoad_string: %@", string_weak_);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear_string: %@", string_weak_);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear_string: %@", string_weak_);
}

@end
