//
//  eventreporterAppDelegate.h
//  eventreporter
//
//  Created by 張翊新 on 2012/4/15.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class eventreporterViewController;

@interface eventreporterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    eventreporterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet eventreporterViewController *viewController;

@end

