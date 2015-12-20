//
//  TableViewController2.h
//  CoffeeShop15
//
//  Created by jie liu on 13/12/2015.
//  Copyright © 2015 ericson. All rights reserved.
//

#include <UIKit/UIKit.h>

#import "x4ql_CommunicateDelegate.h"
#import "x4ql_CoffeeDelegate.h"

#define PI 3.1415926

@interface TableViewController2:UITableViewController<CoffeeDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UINavigationItem *navigator;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) IBOutlet UITableView *mytableview;

@property (strong,nonatomic) NSArray *array;
@property (nonatomic) NSArray *data;

@property (nonatomic,assign) id<CommunicateDelegate> mydelegate;
@property (nonatomic,assign) CLLocationCoordinate2D currentUserLocation;


@property (nonatomic) UIButton *enterBtn;

//- (IBAction)touchEvent:(id)sender;
- (IBAction)backEvent:(id)sender;
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath;

- (double)DistanceLongitude1:(double)longitude1 Lantitude1:(double)lantitude1 Longitude2:(double)longtitude2 Lantitude2:(double)lantitude2;
@end
