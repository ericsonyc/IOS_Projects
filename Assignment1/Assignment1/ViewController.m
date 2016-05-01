//
//  ViewController.m
//  Assignment1
//
//  Created by ericson on 16/5/1.
//  Copyright © 2016年 student. All rights reserved.
//

#import "ViewController.h"
#import "DDClock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DDClock *clock1 = [[DDClock alloc] initWithTheme:DDClockThemeDark position:CGPointMake(([UIScreen mainScreen].bounds.size.width - 200 )/2, 50)];
    CGFloat clockHeight=clock1.frame.size.height;
    
    [[self view] addSubview:clock1];
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    CGRect frame=CGRectMake(0, clockHeight+10+50, width, 40);
    UILabel *manageTime=[[UILabel alloc] initWithFrame:frame];
    manageTime.text=@"Manage your time";
    manageTime.textColor=[UIColor blackColor];
    manageTime.textAlignment=NSTextAlignmentCenter;
    [[self view]addSubview:manageTime];
    
    NSArray *array=[[NSArray alloc]initWithObjects:@"Curriculum Schedule",@"Calendar",@"Plan", nil];
    self.list=array;
    self.timeTableView=[[UITableView alloc]init];
    self.timeTableView.delegate=;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
