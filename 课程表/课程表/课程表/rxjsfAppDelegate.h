//
//  rxjsfAppDelegate.h
//  课程表
//
//  Created by 雨 on 12-11-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rxjsfAppDelegate : UIResponder <UIApplicationDelegate>
{
    IBOutlet UINavigationController *navController;
}

@property (strong , nonatomic) UINavigationController *navController;

@property (strong, nonatomic) IBOutlet UIWindow *window;

@end
