//
//  Coffees.h
//  CoffeeShop15
//
//  Created by jie liu on 14/12/2015.
//  Copyright © 2015 ericson. All rights reserved.
//

#ifndef Coffees_h
#define Coffees_h


#endif /* Coffees_h */

#import <Foundation/Foundation.h>

@interface Coffees : NSObject  //preserve the coffees from plist

@property (nonatomic,strong) NSString *comment;
@property (nonatomic,strong) NSString *name;
@property (nonatomic) float longitude;
@property (nonatomic) float latitude;

+(Coffees *)newCoffeeInstance:(NSString *)name Comments:(NSString *)comment Longitude:(float)longitude Latitude:(float)latitude;

+(NSArray *)getArrayCoffees;

@end