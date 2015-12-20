//
//  WAI_LocationAnnotation.m
//  WhereAmI12
//
//  Created by Terry Payne on 08/11/2012.
//  Copyright (c) 2012 Terry Payne. All rights reserved.
//

#import "WAI_LocationAnnotation.h"

@interface WAI_LocationAnnotation ()

@property (nonatomic, readwrite, copy) NSString *title;
@property (nonatomic, readwrite, copy) NSString *subtitle;
@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;

@end

@implementation WAI_LocationAnnotation

- (id)initWithCoordinate:(CLLocationCoordinate2D)newCoordinate title:(NSString *)newTitle subtitle:(NSString *)newSubtitle {
    
    if ((self = [super init])) {
        [self setTitle:[newTitle copy]];
        [self setSubtitle:[newSubtitle copy]];
        [self setCoordinate:newCoordinate];
    }
    return self;
}

@end
