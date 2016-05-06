//
//  RecordCell.h
//  GroupChat
//
//  Created by ericson on 16/5/6.
//  Copyright © 2016年 student. All rights reserved.
//

#ifndef RecordCell_h
#define RecordCell_h

#import <UIKit/UIKit.h>
#import "Record.h"

@interface RecordCell:UITableViewCell

@property (strong,nonatomic) IBOutlet UILabel *contentLabel;
@property (strong,nonatomic) IBOutlet UILabel *timeLabel;

-(void)setupCell:(Record *)message;

@end

#endif /* RecordCell_h */
