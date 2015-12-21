//
//  AppDelegate.m
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 12/02/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import "AppDelegate.h"

#import "FFCalendarViewController.h"
#import "FFEvent.h"
#import "FFImportantFilesForCalendar.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    
    FFCalendarViewController *rootController = [[FFCalendarViewController alloc]init];
    [rootController setArrayWithEvents:[self arrayWithEvents]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:rootController];
     self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (NSMutableArray *)arrayWithEvents {
    
    FFEvent *event1 = [[FFEvent alloc]init];
    [event1 setStringCustomerName: @"ericson A"];
    [event1 setNumCustomerID:[NSNumber numberWithInt:1]];
    [event1 setDateDay:[NSDate dateWithYear:[NSDate componentsOfCurrentDate].year month:[NSDate componentsOfCurrentDate].month day:[NSDate componentsOfCurrentDate].day]];
    [event1 setDateTimeBegin:[NSDate dateWithHour:10 min:00]];
    [event1 setDateTimeEnd:[NSDate dateWithHour:15 min:13]];
    NSMutableArray *mutableArray1=[NSMutableArray arrayWithCapacity:6];
    [mutableArray1 addObject:@[@111,@"Guest 1",@"guest1@email.com"]];
    [mutableArray1 addObject:@[@111,@"Guest 4",@"guest2@email.com"]];
    [mutableArray1 addObject:@[@111,@"Guest 5",@"guest5@email.com"]];
    [mutableArray1 addObject:@[@111,@"Guest 7",@"guest7@email.com"]];
    [mutableArray1 addObject:@[@111,@"Guest 2",@"guest2@email.com"]];
    [event1 setArrayWithGuests:mutableArray1];
    
    FFEvent *event2 = [FFEvent new];
    [event2 setStringCustomerName: @"ericson B"];
    [event2 setNumCustomerID:@2];
    [event2 setDateDay:[NSDate dateWithYear:[NSDate componentsOfCurrentDate].year month:[NSDate componentsOfCurrentDate].month day:[NSDate componentsOfCurrentDate].day]];
    [event2 setDateTimeBegin:[NSDate dateWithHour:9 min:15]];
    [event2 setDateTimeEnd:[NSDate dateWithHour:12 min:138]];
    NSMutableArray *mutableArray2=[NSMutableArray arrayWithCapacity:6];
    [mutableArray2 addObject:@[@111,@"Guest 2",@"guest2@email.com"]];
    [mutableArray2 addObject:@[@111,@"Guest 4",@"guest4@email.com"]];
    [mutableArray2 addObject:@[@111,@"Guest 5",@"guest5@email.com"]];
    [mutableArray2 addObject:@[@111,@"Guest 7",@"guest7@email.com"]];
    [event2 setArrayWithGuests:mutableArray2];
    
    FFEvent *event3 = [FFEvent new];
    [event3 setStringCustomerName: @"ericson C"];
    [event3 setNumCustomerID:@3];
    [event3 setDateDay:[NSDate dateWithYear:[NSDate componentsOfCurrentDate].year month:[NSDate componentsOfCurrentDate].month day:[NSDate componentsOfCurrentDate].day]];
    [event3 setDateTimeBegin:[NSDate dateWithHour:16 min:00]];
    [event3 setDateTimeEnd:[NSDate dateWithHour:17 min:13]];
    NSMutableArray *mutableArray3=[NSMutableArray arrayWithCapacity:6];
    [mutableArray3 addObject:@[@111,@"Guest 2",@"guest2@email.com"]];
    [mutableArray3 addObject:@[@111,@"Guest 4",@"guest4@email.com"]];
    [mutableArray3 addObject:@[@111,@"Guest 5",@"guest5@email.com"]];
    [mutableArray3 addObject:@[@111,@"Guest 7",@"guest7@email.com"]];
    
    [event3 setArrayWithGuests:mutableArray3];
    
    FFEvent *event4 = [FFEvent new];
    [event4 setStringCustomerName: @"ericson D"];
    [event4 setNumCustomerID:@4];
    [event4 setDateDay:[NSDate dateWithYear:[NSDate componentsOfCurrentDate].year month:[NSDate componentsOfCurrentDate].month day:[NSDate componentsOfCurrentDate].day]];
    [event4 setDateTimeBegin:[NSDate dateWithHour:18 min:00]];
    [event4 setDateTimeEnd:[NSDate dateWithHour:19 min:13]];
    NSMutableArray *mutableArray4=[NSMutableArray arrayWithCapacity:6];
    [mutableArray4 addObject:@[@111,@"Guest 2",@"guest2@email.com"]];
    [mutableArray4 addObject:@[@111,@"Guest 4",@"guest4@email.com"]];
    [mutableArray4 addObject:@[@111,@"Guest 5",@"guest5@email.com"]];
    [mutableArray4 addObject:@[@111,@"Guest 7",@"guest7@email.com"]];
    [event4 setArrayWithGuests:mutableArray4];
    
    FFEvent *event5 = [FFEvent new];
    [event5 setStringCustomerName: @"ericson E"];
    [event5 setNumCustomerID:@5];
    [event5 setDateDay:[NSDate dateWithYear:[NSDate componentsOfCurrentDate].year month:[NSDate componentsOfCurrentDate].month day:[NSDate componentsOfCurrentDate].day]];
    [event5 setDateTimeBegin:[NSDate dateWithHour:20 min:00]];
    [event5 setDateTimeEnd:[NSDate dateWithHour:21 min:13]];
    NSMutableArray *mutableArray5=[NSMutableArray arrayWithCapacity:6];
    [mutableArray5 addObject:@[@111,@"Guest 2",@"guest2@email.com"]];
    [mutableArray5 addObject:@[@111,@"Guest 4",@"guest4@email.com"]];
    [mutableArray5 addObject:@[@111,@"Guest 5",@"guest5@email.com"]];
    [mutableArray5 addObject:@[@111,@"Guest 7",@"guest7@email.com"]];
    [event5 setArrayWithGuests:mutableArray5];
    
    FFEvent *event6 = [FFEvent new];
    [event6 setStringCustomerName: @"ericson F"];
    [event6 setNumCustomerID:@6];
    [event6 setDateDay:[NSDate dateWithYear:[NSDate componentsOfCurrentDate].year month:[NSDate componentsOfCurrentDate].month day:25]];
    [event6 setDateTimeBegin:[NSDate dateWithHour:20 min:00]];
    [event6 setDateTimeEnd:[NSDate dateWithHour:21 min:13]];
    NSMutableArray *mutableArray6=[NSMutableArray arrayWithCapacity:6];
    [mutableArray6 addObject:@[@111,@"Guest 2",@"guest2@email.com"]];
    [mutableArray6 addObject:@[@111,@"Guest 4",@"guest4@email.com"]];
    [mutableArray6 addObject:@[@111,@"Guest 5",@"guest5@email.com"]];
    [mutableArray6 addObject:@[@111,@"Guest 7",@"guest7@email.com"]];
    [event6 setArrayWithGuests:mutableArray6];
    
    FFEvent *event7 = [FFEvent new];
    [event7 setStringCustomerName: @"ericson G"];
    [event7 setNumCustomerID:@7];
    [event7 setDateDay:[NSDate dateWithYear:[NSDate componentsOfCurrentDate].year month:[NSDate componentsOfCurrentDate].month day:1]];
    [event7 setDateTimeBegin:[NSDate dateWithHour:20 min:00]];
    [event7 setDateTimeEnd:[NSDate dateWithHour:21 min:13]];
    NSMutableArray *mutableArray7=[NSMutableArray arrayWithCapacity:6];
    [mutableArray7 addObject:@[@111,@"Guest 2",@"guest2@email.com"]];
    [mutableArray7 addObject:@[@111,@"Guest 4",@"guest4@email.com"]];
    [mutableArray7 addObject:@[@111,@"Guest 5",@"guest5@email.com"]];
    [mutableArray7 addObject:@[@111,@"Guest 7",@"guest7@email.com"]];
    [event7 setArrayWithGuests:mutableArray7];
    
    FFEvent *event8 = [FFEvent new];
    [event8 setStringCustomerName: @"ericson H"];
    [event8 setNumCustomerID:@8];
    [event8 setDateDay:[NSDate dateWithYear:[NSDate componentsOfCurrentDate].year month:[NSDate componentsOfCurrentDate].month day:2]];
    [event8 setDateTimeBegin:[NSDate dateWithHour:20 min:00]];
    [event8 setDateTimeEnd:[NSDate dateWithHour:21 min:13]];
    NSMutableArray *mutableArray8=[NSMutableArray arrayWithCapacity:6];
    [mutableArray8 addObject:@[@111,@"Guest 2",@"guest2@email.com"]];
    [mutableArray8 addObject:@[@111,@"Guest 4",@"guest4@email.com"]];
    [mutableArray8 addObject:@[@111,@"Guest 5",@"guest5@email.com"]];
    [mutableArray8 addObject:@[@111,@"Guest 7",@"guest7@email.com"]];
    [event8 setArrayWithGuests:mutableArray8];
    
    return [NSMutableArray arrayWithArray:@[event1, event2, event3, event4, event5, event6, event7, event8]];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
//    [self saveContext];
}

@end
