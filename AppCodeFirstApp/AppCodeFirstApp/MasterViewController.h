//
//  MasterViewController.h
//  AppCodeFirstApp
//
//  Created by ericson on 15/12/19.
//  Copyright (c) 2015 ericson. All rights reserved.
//


#import <UIKit/UIKit.h>


@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end
