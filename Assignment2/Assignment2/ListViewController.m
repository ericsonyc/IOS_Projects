
#import "ListViewController.h"
#import "MHTabBarController.h"
#import "Message.h"
#import "MessageCell.h"

@implementation ListViewController

- (void)dealloc
{
	NSLog(@"dealloc %@", self);
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	NSLog(@"%@ viewDidLoad", self.title);
    self.messageDatas=[NSMutableArray arrayWithCapacity:10];
    [self reloadData];
}

-(void)reloadData{
    NSDate *date1=[NSDate date];
    UIImage *image1=[[UIImage alloc]initWithContentsOfFile:@"portrait"];
    Message *message1=[[Message alloc]initWithMessageNumber:@"15778945625" messageDate:date1 messageContent:@"This is message one." messageImage:image1];
    [self.messageDatas addObject:message1];
    
    NSDate *date2=[NSDate date];
    UIImage *image2=[[UIImage alloc]initWithContentsOfFile:@"portrait"];
    Message *message2=[[Message alloc]initWithMessageNumber:@"7823354123" messageDate:date2 messageContent:@"This is message two." messageImage:image2];
    [self.messageDatas addObject:message2];
    
    NSDate *date3=[NSDate date];
    UIImage *image3=[[UIImage alloc]initWithContentsOfFile:@"portrait"];
    Message *message3=[[Message alloc]initWithMessageNumber:@"2343463463" messageDate:date3 messageContent:@"This is message three." messageImage:image3];
    [self.messageDatas addObject:message3];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	NSLog(@"%@ viewWillAppear", self.title);
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	NSLog(@"%@ viewDidAppear", self.title);
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	NSLog(@"%@ viewWillDisappear", self.title);
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
	NSLog(@"%@ viewDidDisappear", self.title);
}

- (void)willMoveToParentViewController:(UIViewController *)parent
{
	[super willMoveToParentViewController:parent];
	NSLog(@"%@ willMoveToParentViewController %@", self.title, parent);
}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
	[super didMoveToParentViewController:parent];
	NSLog(@"%@ didMoveToParentViewController %@", self.title, parent);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	[super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
	NSLog(@"%@ willRotateToInterfaceOrientation", self.title);
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.messageDatas count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 92.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//	static NSString *CellIdentifier = @"Cell";
//
//	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//	if (cell == nil)
//		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//
//	cell.selectionStyle = UITableViewCellSelectionStyleGray;
//	cell.textLabel.text = [NSString stringWithFormat:@"%@ - Row %i", self.title, indexPath.row];
    
    static NSString *messageCell=@"messageCell";
    static BOOL isRegNib=NO;
    if(!isRegNib){
        [tableView registerNib:[UINib nibWithNibName:@"TableCell" bundle:nil] forCellReuseIdentifier:messageCell];
        isRegNib=YES;
    }
    MessageCell *cell=[tableView dequeueReusableCellWithIdentifier:messageCell];
    [cell setupCell:self.messageDatas[indexPath.row]];
	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSLog(@"%@, parent is %@", self.title, self.parentViewController);

	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	ListViewController *listViewController1 = [[ListViewController alloc] initWithStyle:UITableViewStylePlain];
	ListViewController *listViewController2 = [[ListViewController alloc] initWithStyle:UITableViewStylePlain];
	
	listViewController1.title = @"Another Tab 1";
	listViewController2.title = @"Another Tab 2";

	MHTabBarController *tabBarController = [[MHTabBarController alloc] init];
	tabBarController.viewControllers = @[listViewController1, listViewController2];
	tabBarController.title = @"Modal Screen";
	tabBarController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] 
		initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];

	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tabBarController];
	navController.navigationBar.tintColor = [UIColor blackColor];
	[self presentViewController:navController animated:YES completion:nil];
}

- (IBAction)done:(id)sender
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
