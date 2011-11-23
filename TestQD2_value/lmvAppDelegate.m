//
//  lmvAppDelegate.m
//  TestQD2_value
//
//  Created by Luis Medina on 11/22/11.
//  Copyright (c) 2011 LMV Consulting. All rights reserved.
//

#import "lmvAppDelegate.h"

@implementation lmvAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
