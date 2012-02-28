//
//  Labeledwebview.m
//  Test1
//
//  Created by 張翊新 on 2012/2/27.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Labeledwebview.h"


@implementation Labeledwebview


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    	toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0, 19, 320, 44)];
		addressField = [[UITextField alloc] initWithFrame: CGRectMake(10, 7, 300, 28)];
		myWebView = [[UIWebView alloc] initWithFrame: CGRectMake(0,64,320,436)];
		addressField.borderStyle = UITextBorderStyleRoundedRect;
		addressField.delegate = self;
		myWebView.scalesPageToFit = YES;
		[self addSubview:toolbar];
		[toolbar addSubview: addressField];
		[self addSubview:myWebView];
	}
    return self;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField { 
	[textField resignFirstResponder];
	[self loadURL:textField.text]; 
	return YES;
}

- (void) loadURL:(NSString *)url {
	[myWebView loadRequest: 
	 [NSURLRequest requestWithURL:
	  [NSURL URLWithString:url]]];
	
	addressField.text = url;
}		
	
- (void)dealloc {
	[myWebView release];
	[toolbar release];
	[backButton release];
	[super dealloc];
}
	/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

@end
