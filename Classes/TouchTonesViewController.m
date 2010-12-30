//
//  TouchTonesViewController.m
//  TouchTones
//
//  Created by Matthew Thomas on 12/29/10.
//  Copyright 2010 Code/Caffeine. All rights reserved.
//

#import "TouchTonesViewController.h"

@interface TouchTonesViewController ()
- (void)handleTap:(UITapGestureRecognizer *)tapGestureRecognizer;
@end

@implementation TouchTonesViewController
@synthesize keypadView;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.keypadView addGestureRecognizer:tapGestureRecognizer];
    [tapGestureRecognizer release];
}

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    self.keypadView = nil;
}


- (void)dealloc {
    [keypadView release];
    [super dealloc];
}

- (void)handleTap:(UITapGestureRecognizer *)tapGestureRecognizer {
    NSLog(@"tap: %@", tapGestureRecognizer);
    CGPoint locationInView = [tapGestureRecognizer locationInView:self.keypadView];
    NSLog(@"locationInView: %@", NSStringFromCGPoint(locationInView));
    NSUInteger key = (NSUInteger)floorf(locationInView.x / 40.0f);
    NSLog(@"key: %lu", (unsigned long)key);
}

@end
