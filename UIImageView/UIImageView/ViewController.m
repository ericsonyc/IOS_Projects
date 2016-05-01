//
//  ViewController.m
//  UIImageView
//
//  Created by ericson on 15/12/29.
//  Copyright © 2015年 ericson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSString *path=[[NSBundle mainBundle] resourcePath];
//    NSString *imagepath=[NSString stringWithFormat:@"%@/1.jpg",path];
//    UIImage *image=[[UIImage alloc]initWithContentsOfFile:imagepath];
#if 0
    UIImage *image1=[UIImage imageNamed:@"1.jpg"];//加载缓存中
    
    UIImageView *imageView=[[UIImageView alloc]initWithImage:image1];
    imageView.frame=CGRectMake(10, 100, 300, 500);
    imageView.backgroundColor=[UIColor redColor];//图片的大小是由载体实现的
    imageView.contentMode=UIViewContentModeScaleAspectFit;//拉伸充满整个载体
#endif
    //播放序列图
    NSMutableArray *imageArray=[[NSMutableArray alloc]init];
    for (int i=1;i<=3; i++) {
        UIImage *image=[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
        [imageArray addObject:image];
    }
    //too cool
    NSLog(@"Hello World!!!");
    
    UIImageView *imageView=[[UIImageView alloc]init];
    imageView.frame=CGRectMake(0, 100, 407, 217);
    imageView.animationImages=imageArray;
    imageView.animationDuration=2;
    imageView.animationRepeatCount=0;
    [imageView startAnimating];
//    [imageView stopAnimating];
    
    
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
