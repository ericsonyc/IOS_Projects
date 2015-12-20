//
//  CoffeeAnnotation.h
//  CoffeeShop15
//
//  Created by jie liu on 14/12/2015.
//  Copyright © 2015 ericson. All rights reserved.
//

#ifndef CoffeeAnnotation_h
#define CoffeeAnnotation_h


#endif /* CoffeeAnnotation_h */

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CoffeeAnnotation : NSObject<MKAnnotation>   //Coffee Annotation
{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}

@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,retain) NSString *title;
@property (nonatomic,retain) NSString *subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)the_coordinate;


@end