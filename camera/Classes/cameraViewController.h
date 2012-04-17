//
//  cameraViewController.h
//  camera
//
//  Created by 張翊新 on 2012/4/17.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cameraViewController : UIViewController 
	<UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
		UIImageView *imageView;
        BOOL newMedia;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
- (IBAction)useCamera;
- (IBAction)useCameraRoll;

@end

