//
//  CoffeeAnnotation.m
//  CoffeeShop15
//
//  Created by jie liu on 14/12/2015.
//  Copyright © 2015 ericson. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "x4ql_CoffeeAnnotation.h"

@implementation CoffeeAnnotation

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)the_coordinate{
    if (self=[super init]) {
        coordinate=the_coordinate;
    }
    return self;
}

- (void)dealloc{
    self.title=nil;
    self.subtitle=nil;
}

@end