//
//  TouchTonesAppDelegate.m
//  TouchTones
//
//  Created by Matthew Thomas on 12/29/10.
//  Copyright 2010 Code/Caffeine. All rights reserved.
//

#import "TouchTonesAppDelegate.h"

#import "TouchTonesViewController.h"

@implementation TouchTonesAppDelegate


@synthesize window;

@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
     
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    // Save data if appropriate.
}

- (void)dealloc {

    [window release];
    [viewController release];
    [super dealloc];
}

@end
