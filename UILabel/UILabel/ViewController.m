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
    label.text=@"fasdkfaksdhkfahsdfhqwkjenfkjshafkwqnekfnkjawsfehwaqe,bfgakjsdhf";
    label.textAlignment=NSTextAlignmentCenter;
    label.textColor=[UIColor colorWithRed:0.1 green:0.8 blue:0.2 alpha:1.0f];
//    label.alpha=0.5f;
    label.font=[UIFont systemFontOfSize:40];
    label.font=[UIFont boldSystemFontOfSize:25];
    label.font=[UIFont italicSystemFontOfSize:25];
    
    for (NSString *name in [UIFont familyNames]){
        NSLog(@"%@",name);
    }
    label.font=[UIFont fontWithName:@"Bodoni 72" size:25];
//    label.shadowColor=[UIColor blackColor];
//    label.shadowOffset=CGSizeMake(5, 5);
    
    label.lineBreakMode=NSLineBreakByWordWrapping;
    label.numberOfLines=0;
    CGSize size=[label.text sizeWithFont:[UIFont systemFontOfSize:30] constrainedToSize:CGSizeMake(355, 10000) lineBreakMode:NSLineBreakByWordWrapping];
    label.frame=CGRectMake(label.frame.origin.x, label.frame.origin.y, label.frame.size.width, size.height);
    NSLog(@"hello world");
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
