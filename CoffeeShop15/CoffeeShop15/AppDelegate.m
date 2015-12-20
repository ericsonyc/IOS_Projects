//
//  AppDelegate.m
//  CoffeeShop15
//
//  Created by jie liu on 13/12/2015.
//  Copyright © 2015 ericson. All rights reserved.
//

#import "AppDelegate.h"
#import "WAI_LocationsTableVC.h"
#import "WAI_MapVC.h"
#import "ViewController.h"
#import "x4ql_TableViewController2.h"
#import "x4ql_MyTableViewController.h"

@interface AppDelegate ()<UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //WAI_LocationsTableVC *locTableVC = [[WAI_LocationsTableVC alloc] initWithStyle:UITableViewStylePlain];
    //WAI_MapVC *mapVC = [[WAI_MapVC alloc] initWithNibName:@"Main" bundle:nil];
    
    
    
    //UITabBarController *vc = [[UITabBarController alloc] init];
    //[vc setViewControllers:@[mapVC, locTableVC]];
    
    //[[self window] setRootViewController:vc];
    // ==========================================================
    
    ViewController *splitViewController = (ViewController *)self.window.rootViewController;
    MyTableViewController *leftroot=[splitViewController.viewControllers firstObject];
    TableViewController2 *left=[leftroot.viewControllers firstObject];
    WAI_MapVC *right=[splitViewController.viewControllers lastObject];
    left.mydelegate=right;
    right.coffeedelegate=left;
    //UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    //navigationController.topViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem;
    //splitViewController.delegate = self;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
