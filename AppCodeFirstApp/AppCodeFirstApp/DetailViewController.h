//
//  DetailViewController.h
//  AppCodeFirstApp
//
//  Created by ericson on 15/12/19.
//  Copyright (c) 2015 ericson. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
