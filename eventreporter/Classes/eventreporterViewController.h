//
//  eventreporterViewController.h
//  eventreporter
//
//  Created by 張翊新 on 2012/4/15.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface eventreporterViewController : UIViewController {
	IBOutlet UITextField *startField;
	IBOutlet UITextField *endField;
	IBOutlet UILabel *bottomLabel;
	IBOutlet UIButton *resetButton;
	//IBOutlet reportView *view;
}

- (void)manageTouches:(NSSet *)touches;

@end

