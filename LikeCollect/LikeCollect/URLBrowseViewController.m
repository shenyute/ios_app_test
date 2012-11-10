//
//  URLBrowseViewController.m
//  LikeCollect
//
//  Created by 張翊新 on 12/11/10.
//  Copyright (c) 2012年 張翊新. All rights reserved.
//

#import "URLBrowseViewController.h"

@interface URLBrowseViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation URLBrowseViewController

- (IBAction)dismiss:(id)sender
{
    [self.presentingViewController dismissModalViewControllerAnimated:YES];
}

@synthesize urlStr = _urlStr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:self.urlStr];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
