//
//  LikeCollectViewController.m
//  LikeCollect
//
//  Created by 張翊新 on 12/11/9.
//  Copyright (c) 2012年 張翊新. All rights reserved.
//

#import "LikeCollectViewController.h"
#import "LikeCollectAppDelegate.h"
#import "LikeURLsViewController.h"

@interface LikeCollectViewController () 

@end


@implementation LikeCollectViewController

#pragma mark - Helper methods

/*
 * Configure the logged in versus logged out UX
 */
- (void)sessionStateChanged:(NSNotification*)notification
{
    if (FBSession.activeSession.isOpen) {
        NSLog(@"fb seesion is open!");
    } else {
        [self performSegueWithIdentifier:@"SegueToLogin" sender:self];
    }
}

#pragma mark - Action methods
- (IBAction)performLogout:(UIButton *)sender
{
    NSLog(@"fb logout!");
    LikeCollectAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate closeSession];
    [self performSegueWithIdentifier:@"SegueToLogin" sender:self];
}

- (IBAction)showURLs:(id)sender
{
    LikeURLsViewController *urlVC = [[LikeURLsViewController alloc] init];
    
    // Present view controller modally.
    if ([self
         respondsToSelector:@selector(presentViewController:animated:completion:)]) {
        // iOS 5+
        [self presentViewController:urlVC animated:YES completion:nil];
    } else {
        [self presentModalViewController:urlVC animated:YES];
    }
}

#pragma mark - View life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Register for notifications on FB session state changes
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(sessionStateChanged:)
                                                 name:FBSessionStateChangedNotification
                                               object:nil];
    
    // Register for notifications on menu data changes
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(menuDataChanged:)
                                                 name:FBMenuDataChangedNotification
                                               object:nil];
     
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (FBSession.activeSession.isOpen) {
        // If the user's session is active, personalize, but
        // only if this is not deep linking into the order view.
        ;
    } else if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        // Check the session for a cached token to show the proper authenticated
        // UI. However, since this is not user intitiated, do not show the login UX.
        //AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        //[appDelegate openSessionWithAllowLoginUI:NO];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Present login modal if necessary after the view has been
    // displayed, not in viewWillAppear: so as to allow display
    // stack to "unwind"
    if (FBSession.activeSession.isOpen) {
        NSLog(@"fb session is open");
    } else if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded ||
               FBSession.activeSession.state == FBSessionStateCreatedOpening) {
        NSLog(@"fb session state is loaded/opening");
    } else {
        NSLog(@"goto fb login");
        [self performSegueWithIdentifier:@"SegueToLogin" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
