//
//  Note.m
//  Assignment3
//
//  Created by ericson on 16/5/5.
//  Copyright © 2016年 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@implementation Note

-(id)initWithMessage:(NSString *)mess Date:(NSDate *)time{
    self.message=mess;
    self.date=[time mutableCopy];
    return self;
}

@end