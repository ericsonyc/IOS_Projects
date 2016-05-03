//
//  Message.h
//  Assignment2
//
//  Created by ericson on 16/5/3.
//  Copyright © 2016年 student. All rights reserved.
//

#ifndef Message_h
#define Message_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Message : NSObject

@property (nonatomic,assign) NSString *number;
@property (nonatomic,assign) NSDate *now;
@property (nonatomic,assign) NSString *content;
@property (nonatomic,assign) UIImage *portrait;

- (id)initWithMessageNumber:(NSString *)num messageDate:(NSDate *)time messageContent:(NSString *)neirong messageImage:(UIImage *)image;

@end

#endif /* Message_h */
