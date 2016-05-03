//
//  MessageCell.m
//  Assignment2
//
//  Created by ericson on 16/5/3.
//  Copyright © 2016年 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MessageCell.h"

@implementation MessageCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
    }
    return self;
}

-(void)setupCell:(Message *)message{
    self.num_label.text=message.number;
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    self.time_label.text=[dateFormatter stringFromDate:message.now];
    self.content_label.text=message.content;
    self.imageView.image=message.portrait;
}

@end