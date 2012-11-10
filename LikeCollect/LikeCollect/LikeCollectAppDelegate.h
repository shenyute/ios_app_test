//
//  LikeCollectAppDelegate.h
//  LikeCollect
//
//  Created by 張翊新 on 12/11/9.
//  Copyright (c) 2012年 張翊新. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

extern NSString *const FBSessionStateChangedNotification;
extern NSString *const FBMenuDataChangedNotification;

typedef void(^UserDataLoadedHandler)(id sender, id<FBGraphUser> user);

@interface LikeCollectAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) id<FBGraphUser> user;

- (BOOL)openSessionWithAllowLoginUI:(BOOL)allowLoginUI;
- (void)closeSession;
- (void)requestUserData:(UserDataLoadedHandler)handler;

@end
