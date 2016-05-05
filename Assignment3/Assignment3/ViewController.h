//
//  ViewController.h
//  Assignment3
//
//  Created by ericson on 16/5/5.
//  Copyright © 2016年 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchResultsUpdating>

@property (nonatomic,strong) NSMutableArray *notedatas;
@property (nonatomic,strong) NSMutableArray *searchnotes;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchController *searchController;

@end

