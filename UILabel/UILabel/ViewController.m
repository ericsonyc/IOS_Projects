//
//  ViewController.m
//  UILabel
//
//  Created by ericson on 15/12/25.
//  Copyright © 2015年 ericson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label=[[UILabel alloc]init];
    label.frame=CGRectMake(10, 100, 300, 30);
    label.backgroundColor=[UIColor redColor];
    label.text=@"I love you";
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=[UIColor colorWithRed:0.1 green:0.8 blue:0.2 alpha:1];
    [self.view addSubview:label];
    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(20, 20, 20, 20)];
    [view setBounds:CGRectMake(-20, -20, 20, 20)];
    view.backgroundColor=[UIColor blackColor];
    [self.view addSubview:view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
