//
//  eventreporterViewController.m
//  eventreporter
//
//  Created by 張翊新 on 2012/4/15.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "eventreporterViewController.h"

@implementation eventreporterViewController

- (void)resetPage:(id)sender {
	startField.text = @"Begin: 159,230";
	startField.center = CGPointMake(159,230);
	endField.text = @"Begin: 159,230";
	endField.center = CGPointMake(159,230);
	bottomLabel.text = [NSString string];
}

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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[resetButton addTarget:self action:@selector(resetPage:)
	   forControlEvents:UIControlEventTouchUpInside];
	myText.returnKeyType = UIReturnKeyDone;
    [super viewDidLoad];
}


- (IBAction)changeColor:(id)sender { 
	int red;
	int green;
	int blue;
	if ([myText.text caseInsensitiveCompare:@"red"] == NSOrderedSame) {
		red = 1;
		green = 0;
		blue = 0;
	} else if ([myText.text caseInsensitiveCompare:@"blue"] == NSOrderedSame) {
		red = 0;
		green = 0;
		blue = 1;
	} else if ([myText.text caseInsensitiveCompare:@"green"] == NSOrderedSame) { 
		red = 0; 
		green = 1;
		blue = 0;
	} else {
		red = .5; green = .5; blue = .5;
	} float newShade = mySlider.value /
	(mySlider.maximumValue - mySlider.minimumValue); 
	[self.view setBackgroundColor: [UIColor colorWithRed:red green:green blue:blue alpha:newShade]];
}

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
