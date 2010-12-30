//
//  TouchTonesAppDelegate.h
//  TouchTones
//
//  Created by Matthew Thomas on 12/29/10.
//  Copyright 2010 Code/Caffeine. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TouchTonesViewController;

@interface TouchTonesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TouchTonesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TouchTonesViewController *viewController;

@end
