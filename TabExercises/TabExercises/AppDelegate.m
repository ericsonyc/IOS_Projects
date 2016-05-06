//
//  AppDelegate.m
//  TabExercises
//
//  Created by ericson on 16/5/6.
//  Copyright © 2016年 student. All rights reserved.
//

#import "AppDelegate.h"
#import "NGColoredViewController.h"
#import "NGTabBar.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NGColoredViewController *vc1 = [[NGColoredViewController alloc] initWithNibName:nil bundle:nil];
    NGColoredViewController *vc2 = [[NGColoredViewController alloc] initWithNibName:nil bundle:nil];
    NGColoredViewController *vc3 = [[NGColoredViewController alloc] initWithNibName:nil bundle:nil];
    NGColoredViewController *vc4 = [[NGColoredViewController alloc] initWithNibName:nil bundle:nil];
    NGColoredViewController *vc5 = [[NGColoredViewController alloc] initWithNibName:nil bundle:nil];
    
    vc1.ng_tabBarItem = [NGTabBarItem itemWithTitle:@"Home" image:nil];
    vc2.ng_tabBarItem = [NGTabBarItem itemWithTitle:@"Images" image:nil];
    vc3.ng_tabBarItem = [NGTabBarItem itemWithTitle:@"Live" image:image3];
    vc4.ng_tabBarItem = [NGTabBarItem itemWithTitle:@"Contact" image:image4];
    vc5.ng_tabBarItem = [NGTabBarItem itemWithTitle:@"Settings" image:image5];
    
    NSArray *viewController = [NSArray arrayWithObjects:vc1,vc2,vc3,vc4,vc5,nil];
    
    NGTabBarController *tabBarController = [[NGTestTabBarController alloc] initWithDelegate:self];
    
    tabBarController.animation = NGTabBarControllerAnimationMoveAndScale;
    tabBarController.layoutStrategy = $isPhone() ? NGTabBarLayoutStrategyEvenlyDistributed : NGTabBarLayoutStrategyCentered;
    tabBarController.itemPadding = 10.f;
    tabBarController.showsItemHighlight = NO;
    tabBarController.tintColor = [UIColor redColor];
    tabBarController.viewControllers = viewController;
    self.window.rootViewController = tabBarController;
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
