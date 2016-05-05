//
//  ViewController.m
//  Assignment3
//
//  Created by ericson on 16/5/5.
//  Copyright © 2016年 student. All rights reserved.
//

#import "ViewController.h"
#import "Note.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect rect=[[UIScreen mainScreen] bounds];
    self.tableView=[[UITableView alloc]initWithFrame:rect];
    _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    
    _searchController.searchResultsUpdater = self;
    
    _searchController.dimsBackgroundDuringPresentation = false;
    [self.searchController.searchBar sizeToFit];
    
    _searchController.hidesNavigationBarDuringPresentation = NO;
    
    _searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    [self loadData];
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadData{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : @"yyyy/M/d hh:mm"];
    NSString *stringTime=@"2016/5/3 12:50";
    NSDate *temp=[formatter dateFromString:stringTime];
    Note *note1=[[Note alloc]initWithMessage:@"This is note one!" Date:temp];
    [self.notedatas addObject:note1];
    
    stringTime=@"2016/5/4 11:20";
    temp=[formatter dateFromString:stringTime];
    Note *note2=[[Note alloc]initWithMessage:@"This is note two!" Date:[temp mutableCopy]];
    [self.notedatas addObject:note2];
    
    stringTime=@"2016/5/4 13:10";
    temp=[formatter dateFromString:stringTime];
    Note *note3=[[Note alloc]initWithMessage:@"This is note three!" Date:[temp mutableCopy]];
    [self.notedatas addObject:note3];
}

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    [self.searchnotes removeAllObjects];
    NSString *pattern=@"\\w*";
    pattern=[pattern stringByAppendingFormat:@"%@\\w*",self.searchController.searchBar.text];
    NSRegularExpression *reg=[NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
    NSMutableArray *list=[[NSMutableArray alloc]initWithCapacity:6];
    for (int i=0; i<[self.notedatas count]; i++) {
        Note *note=[self.notedatas objectAtIndex:i];
        NSArray* match = [reg matchesInString:note.message options:NSMatchingAnchored range:NSMakeRange(0, [note.message length])];
        if (match.count>0) {
            [list addObject:note];
        }
    }
    //    NSMutableArray *List=[self.searchList mutableCopy];
    self.searchnotes=[list mutableCopy];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    NSLog(@"message count: %d",[_messageDatas count]);
    if (self.searchController.active) {
        return [self.searchnotes count];
    }else
        return [self.notedatas count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *messageCell=@"messageCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:messageCell];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:messageCell];
    }
    if (self.searchController.active) {
        Note *note=(Note *)self.searchnotes[indexPath.row];
        cell.textLabel.text=note.message;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSTimeZone *timeZone = [NSTimeZone localTimeZone];
        
        [formatter setTimeZone:timeZone];
        [formatter setDateFormat : @"yyyy/M/d hh:mm"];
        cell.detailTextLabel.text=[formatter stringFromDate:note.date];
    }else{
        Note *note=(Note *)self.notedatas[indexPath.row];
        cell.textLabel.text=note.message;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSTimeZone *timeZone = [NSTimeZone localTimeZone];
        
        [formatter setTimeZone:timeZone];
        [formatter setDateFormat : @"yy/M/d hh:mm"];
        cell.detailTextLabel.text=[formatter stringFromDate:note.date];
    }
    return cell;
}

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    return YES;
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self.notedatas removeObjectAtIndex:indexPath.row];

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
