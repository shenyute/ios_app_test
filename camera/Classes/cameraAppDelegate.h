//
//  cameraAppDelegate.h
//  camera
//
//  Created by 張翊新 on 2012/4/17.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class cameraViewController;

@interface cameraAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    cameraViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet cameraViewController *viewController;

@end

