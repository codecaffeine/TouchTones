//
//  TouchTonesViewController.m
//  TouchTones
//
//  Created by Matthew Thomas on 12/29/10.
//  Copyright 2010 Code/Caffeine. All rights reserved.
//

#import "TouchTonesViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface TouchTonesViewController ()
@property (nonatomic, retain) AVAudioPlayer *audioPlayer;
- (void)handleTap:(UITapGestureRecognizer *)tapGestureRecognizer;
@end

@implementation TouchTonesViewController
@synthesize keypadView;
@synthesize audioPlayer;

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
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"60" ofType:@"caf"]] 
                                                         error:&error];
    if (!self.audioPlayer && error) {
        NSLog(@"error: %@", error);
    }
    [self.audioPlayer prepareToPlay];
    
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
    [audioPlayer release];
    [super dealloc];
}

- (void)handleTap:(UITapGestureRecognizer *)tapGestureRecognizer {
    NSLog(@"tap: %@", tapGestureRecognizer);
    CGPoint locationInView = [tapGestureRecognizer locationInView:self.keypadView];
    [self.audioPlayer play];
    NSLog(@"locationInView: %@", NSStringFromCGPoint(locationInView));
    NSUInteger key = (NSUInteger)floorf(locationInView.x / 40.0f);
    NSLog(@"key: %lu", (unsigned long)key);
}

@end
