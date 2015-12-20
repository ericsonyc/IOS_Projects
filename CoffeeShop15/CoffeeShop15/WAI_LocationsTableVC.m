//
//  WAI_LocationsTableVC.m
//  WhereAmI12
//
//  Created by Terry Payne on 07/11/2012.
//  Copyright (c) 2012 Terry Payne. All rights reserved.
//

#import "WAI_LocationsTableVC.h"

@interface WAI_LocationsTableVC ()

@property (nonatomic, strong) NSMutableArray *locationArray;
@property (nonatomic, strong) NSString *locationsFileName;

@end

@implementation WAI_LocationsTableVC

// ==================================================================
// Lazy instantiation of location Array and filename
// ==================================================================

- (NSString *) locationsFileName {
    if (_locationsFileName == nil) {
        // Find the locations.plist file in the user's Documents Directory
        NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0];
        
        // <Application Home>/Documents/locations.plist
        _locationsFileName = [documentsPath stringByAppendingPathComponent:@"locations.plist"];
        
    }
    return _locationsFileName;
}

- (NSMutableArray *) locationArray {
    if (_locationArray == nil) {
        // Load the data into the Array
        if((_locationArray = [[NSMutableArray alloc] initWithContentsOfFile:[self locationsFileName]]) == nil) {
            // Failed to find file - probably doesn't exist.  Just create an empty array
            _locationArray = [[NSMutableArray alloc] init];
        }
    }
    return _locationArray;
}

- (void) syncLocationArray {
    [[self locationArray] writeToFile:[self locationsFileName] atomically:YES];
}

// =================================================
#pragma mark - Lifecycle Methods

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        [self setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"Locations" image:[UIImage imageNamed:@"74-location.png"] tag:1]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [[self tableView] reloadData];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self syncLocationArray];
    [self setLocationArray:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// =================================================
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self locationArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSDictionary *entryDict = (NSDictionary *)[[self locationArray] objectAtIndex:[indexPath row]];
    [[cell textLabel] setText:[entryDict objectForKey:@"label"]];
    
    NSString *locStr = [NSString stringWithFormat:@"%.3f, %.3f",
                        [[entryDict objectForKey:@"latitude"] doubleValue],
                        [[entryDict objectForKey:@"longitude"] doubleValue]];
    [[cell detailTextLabel] setText:locStr];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [[self locationArray] removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

// =================================================
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
