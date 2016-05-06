
#import <Foundation/Foundation.h>
#import "ContactController.h"
#import "ContactCell.h"

@implementation ContactController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.datas=[[NSMutableArray alloc]initWithCapacity:6];
    self.searchDatas=[[NSMutableArray alloc]initWithCapacity:6];
    
    CGRect rectStatus=[[UIApplication sharedApplication]statusBarFrame];
    //    CGRect rectNav=self.navigationController.navigationBar.frame;
    
    CGRect frame=[[UIScreen mainScreen] bounds];
    CGRect rect=CGRectMake(0, rectStatus.origin.y, frame.size.width, frame.size.height-rectStatus.size.height);
    self.tableView=[[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    [self loadData];
    
    [self.view addSubview:self.tableView];
}

-(void)loadData{
    Contact *contact1=[[Contact alloc]initWithMessageName:@"This is contact one." image:@"contact.png"];
    
    Contact *contact2=[[Contact alloc]initWithMessageName:@"This is contact two." image:@"contact.png"];
    
    [self.datas addObject:contact1];
    [self.datas addObject:contact2];
}

-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - UISearchResultsUpdating
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    [self.searchDatas removeAllObjects];
//    NSString *pattern=@"\\S*";
//    pattern=[pattern stringByAppendingFormat:@"%@\\S*",self.searchController.searchBar.text];
//    NSRegularExpression *reg=[NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
//    NSRegularExpression *reg1=[NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
//    NSMutableArray *list=[[NSMutableArray alloc]initWithCapacity:6];
//    for (int i=0; i<[self.datas count]; i++) {
//        Record *record=[self.datas objectAtIndex:i];
//        NSArray* match = [reg matchesInString:record.content options:NSMatchingCompleted range:NSMakeRange(0, [record.content length])];
//        if (match.count>0) {
//            [list addObject:record];
//            continue;
//        }
//        match=[reg1 matchesInString:record.date options:NSMatchingCompleted range:NSMakeRange(0, [record.date length])];
//        if (match.count>0) {
//            [list addObject:record];
//            continue;
//        }
//    }
//    //    NSMutableArray *List=[self.searchList mutableCopy];
//    self.searchDatas=[list mutableCopy];
//    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    NSLog(@"message count: %d",[_messageDatas count]);
//    if (self.searchController.active) {
//        return [self.searchDatas count];
//    }else{
//        return [self.datas count];
//    }

    return [self.datas count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *messageCell=@"messageCell";
    ContactCell *cell=[tableView dequeueReusableCellWithIdentifier:messageCell];
    if(cell==nil){
        NSArray *views=[[NSBundle mainBundle]loadNibNamed:@"ContactCell" owner:nil options:nil];
        cell=(ContactCell *)[views lastObject];
        CGRect frame=cell.imageView.frame;
        frame.size.width=50.0f;
        [cell.imageView setFrame:frame];
    }
    Contact *record;
//    if (self.searchController.active) {
//        record=(Record *)self.searchDatas[indexPath.row];
//    }else{
//        record=(Record *)self.datas[indexPath.row];
//    }
    record=(Contact *)self.datas[indexPath.row];
    cell.contentLabel.text=record.name;
    cell.contentLabel.font=[UIFont fontWithName:@"Arial" size:15];
    
    cell.imageView.image=[UIImage imageNamed:record.imageUrl];
    
    return cell;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self.datas removeObjectAtIndex:indexPath.row];
        
        [self.tableView reloadData];
    }else if(editingStyle == UITableViewCellEditingStyleInsert){
        
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@, parent is %@", self.title, self.parentViewController);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end