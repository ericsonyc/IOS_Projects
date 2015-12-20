//
//  CommunicateDelegate.h
//  CoffeeShop15
//
//  Created by jie liu on 14/12/2015.
//  Copyright © 2015 ericson. All rights reserved.
//

#ifndef CommunicateDelegate_h
#define CommunicateDelegate_h


#endif /* CommunicateDelegate_h */

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@protocol CommunicateDelegate <NSObject> //left table view delegate to communicate with right mapview

@required
- (void)clearPins;

- (CLLocationCoordinate2D)getLocation;

- (void)selectCoffeeShop:(CLLocationCoordinate2D)loc;

- (void)showAllPins:(NSArray *)array;

@end