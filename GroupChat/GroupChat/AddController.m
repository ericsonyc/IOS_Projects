
#import "AddController.h"

@implementation AddController

- (void)viewDidLoad
{
	[super viewDidLoad];
	NSLog(@"%@ viewDidLoad", self.title);
    NSArray *views=[[NSBundle mainBundle]loadNibNamed:@"AddGroup" owner:nil options:nil];
    self.addview=(AddView *)[views lastObject];
    CGRect rectNav=self.navigationController.navigationBar.frame;
    CGRect frame=[UIScreen mainScreen].bounds;
    CGRect rect=CGRectMake(0, rectNav.size.height, frame.size.width, frame.size.height-rectNav.size.height);
    self.addview.frame=rect;
    [self.view addSubview:self.addview];
}


@end
