//
//  Plan.m
//  Assignment1
//
//  Created by ericson on 16/5/2.
//  Copyright © 2016年 student. All rights reserved.
//

#import "Plan.h"

@interface Plan ()

@end

@implementation Plan

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    
    // 导航栏（navigationbar）
    CGRect rectNav = self.navigationController.navigationBar.frame;
    CGRect frame=[UIScreen mainScreen].bounds;
    self.textView=[[UITextView alloc]initWithFrame:CGRectMake(1, rectStatus.size.height+rectNav.size.height, frame.size.width-1, frame.size.height/2-1)];
    self.textView.layer.borderWidth=1.0;
    self.textView.layer.borderColor=[[UIColor grayColor]CGColor];
//    self.textView.backgroundColor=[UIColor yellowColor];
    [[self view]addSubview:self.textView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
