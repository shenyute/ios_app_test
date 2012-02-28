//
//  Labeledwebview.h
//  Test1
//
//  Created by 張翊新 on 2012/2/27.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Labeledwebview : UIView<UITextFieldDelegate> {
	UIWebView *myWebView;
	UIToolbar *toolbar;
	UITextField *addressField;
	UIBarItem *backButton;
}

@property(nonatomic, retain) UIWebView *myWebView;
@property(nonatomic, retain) UIToolbar *toolbar;
@property(nonatomic, retain) UITextField *addressField;

- (void)loadURL:(NSString *)url;
@end
