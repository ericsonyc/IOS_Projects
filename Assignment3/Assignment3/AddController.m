#import <Foundation/Foundation.h>
#import "AddController.h"
#import "Message.h"
#import "GroupMessage.h"
#import "InputView.h"

@implementation AddController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    CGRect rectStatus=[[UIApplication sharedApplication]statusBarFrame];
    CGRect rectNav=self.navigationController.navigationBar.frame;
    
    CGRect frame=[[UIScreen mainScreen] bounds];
    CGRect rect=CGRectMake(0, rectStatus.size.height+rectNav.size.height, frame.size.width, frame.size.height-rectStatus.size.height-rectNav.size.height);
//    InputView *inputView=[[InputView alloc]initWithFrame:rect];
    NSArray *views=[[NSBundle mainBundle]loadNibNamed:@"Input" owner:nil options:nil];
    InputView *inputView=(InputView *)[views lastObject];
    inputView.frame=rect;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : @"yyyy/M/d HH:mm"];
    [inputView setup:[formatter stringFromDate:[NSDate date]] like:NO];
    
        
    [self.view addSubview:inputView];
    
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonSystemItemAction target:self action:@selector(clickSave:)];
    self.navigationItem.rightBarButtonItem=rightButton;
}

-(void)clickSave:(id)sender{
    
}

-(void)didReceiveMemoryWarning{
    
}
@end
