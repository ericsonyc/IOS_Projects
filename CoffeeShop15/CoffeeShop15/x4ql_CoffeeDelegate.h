//
//  CoffeeDelegate.h
//  CoffeeShop15
//
//  Created by jie liu on 14/12/2015.
//  Copyright © 2015 ericson. All rights reserved.
//

#ifndef CoffeeDelegate_h
#define CoffeeDelegate_h


@class Coffees;
@protocol CoffeeDelegate <NSObject> //delegate to deliver information from right mapview to left tableview

- (void)sortCafes;

@end

#endif /* CoffeeDelegate_h */

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

