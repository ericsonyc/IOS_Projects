//
//  ViewController.h
//  Assignment1
//
//  Created by ericson on 16/5/1.
//  Copyright © 2016年 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScheduleController.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NSArray *list;
@property (nonatomic,retain) UITableView *  timeTableView;
@property (nonatomic,strong) ScheduleController *scheduleController;
@end

