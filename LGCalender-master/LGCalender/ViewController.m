//
//  ViewController.m
//  LGCalender
//
//  Created by jamy on 15/6/21.
//  Copyright (c) 2015年 jamy. All rights reserved.
//

#import "ViewController.h"
#import "LGCalendar.h"

@interface ViewController ()<UITextFieldDelegate, LGCalendarDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) LGCalendar *LGCalendar;

- (IBAction)click;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LGCalendar *calendar = [[LGCalendar alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 240)];
    [self.view addSubview:calendar];
    calendar.delegate = self;
    self.LGCalendar = calendar;
}

-(void)LGCalendar:(LGCalendar *)calendar didSelectDate:(NSDate *)selectDate
{
    NSLog(@"select date:%@", selectDate);
    [self.textField setText:[NSString stringWithFormat:@"%@", selectDate]];
}



- (IBAction)click {
    [self.LGCalendar setCurrentDate:[NSDate date]];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
