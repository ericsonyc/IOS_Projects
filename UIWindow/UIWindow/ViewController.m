//
//  ViewController.m
//  UIWindow
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
    
    //init view
    UIView *view1=[[UIView alloc]init];
    //frame width and height
    NSLog(@"%f",[[UIScreen mainScreen] bounds].size.height);
    NSLog(@"%f",[[UIScreen mainScreen] bounds].size.width);
    view1.frame=CGRectMake(10, 30, 394, 696);
    //set background
    view1.backgroundColor=[UIColor redColor];
    //add to the parent view
    [self.view addSubview:view1];
    
    NSLog(@"x:%f y=%f w=%f h=%f",view1.bounds.origin.x,view1.bounds.origin.y,view1.bounds.size.width,view1.bounds.size.height);
    NSLog(@"center x:%f y=%f",view1.center.x,view1.center.y);
    
    //parent view
    UIView *superview=view1.superview;
    superview.backgroundColor=[UIColor greenColor];
    
    UIView *view2=[[UIView alloc]init];
    //points are set according to its parent view
    view2.frame=CGRectMake(10, 100, 300, 30);
    view2.tag=2;
    view2.backgroundColor=[UIColor blackColor];
    [view1 addSubview:view2];
    
    UIView *view3=[[UIView alloc]init];
    view3.frame=CGRectMake(20, 50, 100, 100);
    view3.tag=3;
    view3.backgroundColor=[UIColor purpleColor];
    [view1 addSubview:view3];
    
    //subviews
    NSArray *subViewsArray=view1.subviews;
    for (UIView *view in subViewsArray){
        if (view.tag==2) {
            view.backgroundColor=[UIColor whiteColor];
        }
        
    }
    
    UIView *subView=[view1 viewWithTag:2];
    subView.backgroundColor=[UIColor grayColor];
    
    //alter hierarchy
    //in the same parent view, the first added view will be covered
    
//    UIView *view4=[[UIView alloc]init];
//    view4.frame=CGRectMake(10, 100, 300, 300);
//    view4.backgroundColor=[UIColor orangeColor];
//    [self.view addSubview:view4];
    
    [view1 exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    UIView *view5=[[UIView alloc]init];
    view5.frame=CGRectMake(7, 80, 200, 200);
    view5.backgroundColor=[UIColor brownColor];
//    [view1 insertSubview:view5 atIndex:2];
    [view1 insertSubview:view5 aboveSubview:view3];
    [view1 bringSubviewToFront:view3];
    
    //adaptive
    UIView *backView=[[UIView alloc]init];
    backView.frame=CGRectMake([UIScreen mainScreen].bounds.size.width/2-25, 400, 50, 50);
    backView.backgroundColor=[UIColor blackColor];
    backView.autoresizesSubviews=YES;
    backView.tag=1001;
    [self.view addSubview:backView];
    
    UIView *topview=[[UIView alloc]init];
    topview.frame=CGRectMake(10, 10, 30, 30);
    topview.backgroundColor=[UIColor greenColor];
    topview.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [backView addSubview:topview];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(10, 550, 355, 30);
    btn.backgroundColor=[UIColor yellowColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)btnClick{
    UIView *view=[self.view viewWithTag:1001];
    view.frame=CGRectMake(view.frame.origin.x-5, view.frame.origin.y-5, view.frame.size.width+10, view.frame.size.height+10);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
