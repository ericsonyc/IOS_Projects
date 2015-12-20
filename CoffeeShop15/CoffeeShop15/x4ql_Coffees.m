//
//  Coffee.m
//  CoffeeShop15
//
//  Created by jie liu on 14/12/2015.
//  Copyright © 2015 ericson. All rights reserved.
//

#import "x4ql_Coffees.h"

@implementation Coffees

+ (Coffees *)newCoffeeInstance:(NSString *)name Comments:(NSString *)comment Longitude:(float)longitude Latitude:(float)latitude{
    Coffees *coffee=[[Coffees alloc]init];
    coffee.name=name;
    coffee.comment=comment;
    coffee.longitude=longitude;
    coffee.latitude=latitude;
    return coffee;
}

+ (NSArray *)getArrayCoffees{
    NSArray *array;
    NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"CityCycleRideLocations" ofType:@"plist"];
    NSMutableArray *anArray=[[NSMutableArray alloc]initWithContentsOfFile:plistPath];
    array=[NSArray arrayWithArray:anArray];
    return array;
}

@end