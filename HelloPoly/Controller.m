//
//  Controller.m
//
//  Created by 張翊新 on 2012/3/4.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"

@implementation Controller

- (void)updateInterface {
	if ([polygon numberOfSides] < [polygon maximumNumberOfSides]) {
		increaseButton.enabled = YES;
	} else {
		increaseButton.enabled = NO;
	}
	if ([polygon numberOfSides] > [polygon minimumNumberOfSides]) {
		decreaseButton.enabled = YES;
	} else {
		decreaseButton.enabled = NO;
	}
	NSLog(@"update numberOfSides %d", [polygon numberOfSides]);
	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", [polygon numberOfSides]];
	polygonLabel.text = [polygon name];
}

- (void)savePrefs {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	[defaults setInteger:polygon.numberOfSides forKey:@"numberOfSides"];
}

- (IBAction)decrease:(id)sender {
	int sides = [polygon numberOfSides];
	[polygon setNumberOfSides:sides-1];
	[self updateInterface];
	if (sides != [polygon numberOfSides]) {
		[polyView repaint];
		[self savePrefs];
	}
    NSLog(@"I'm in the decrease method");
}

- (IBAction)increase:(id)sender {
	int sides = [polygon numberOfSides];
	[polygon setNumberOfSides:sides+1];
	[self updateInterface];
	if (sides != [polygon numberOfSides]) {
		[polyView repaint];
		[self savePrefs];
	}
    NSLog(@"I'm in the increase method");
}
	
- (void)awakeFromNib {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	int sides = [defaults integerForKey: @"numberOfSides"];
	
	if (sides == 0)
		sides = 5;
	[polygon setNumberOfSides:sides];
	[polygon setMaximumNumberOfSides:12];
	[polygon setMinimumNumberOfSides:3];
	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", sides];
	[polygon setNumberOfSides:sides];
	[self updateInterface];
	NSLog(@"My polygon: %@", polygon);
}

@end
