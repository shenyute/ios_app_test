//
//  eventreporterViewController.m
//  eventreporter
//
//  Created by 張翊新 on 2012/4/15.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "eventreporterViewController.h"

@implementation eventreporterViewController


- (void)manageTouches:(NSSet *)touches {
	for (UITouch *touch in touches) {
		if(touch.phase == UITouchPhaseBegan) {
			CGPoint touchPos = [touch locationInView:self.view];
			startField.center = touchPos;
			startField.text = [NSString stringWithFormat:@"Begin: %3.0f,%3.0f",
							   touchPos.x, touchPos.y];
		} else if(touch.phase == UITouchPhaseMoved) {
			bottomLabel.text = @"Touch is moving...";
		} else if (touch.phase == UITouchPhaseEnded) {
			if (touch.tapCount > 1) {
				bottomLabel.text = [NSString stringWithFormat:
									@"Taps: %2i", touch.tapCount];
			} else {
				bottomLabel.text = [NSString string];
			}
			CGPoint touchPos = [touch locationInView:self.view];
			endField.center = touchPos;
			endField.text = [NSString stringWithFormat:
							 @"End: %3.0f,%3.0f", touchPos.x, touchPos.y];
		}
	}
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
