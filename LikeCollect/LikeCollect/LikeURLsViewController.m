//
//  LikeURLsViewController.m
//  LikeCollect
//
//  Created by 張翊新 on 12/11/10.
//  Copyright (c) 2012年 張翊新. All rights reserved.
//

#import "LikeURLsViewController.h"
#import "LikeCollectAppDelegate.h"
#import "URLBrowseViewController.h"

@interface LikeURLsViewController ()

@end

@implementation LikeURLsViewController

@synthesize likeURLs = _likeURLs;


- (void)setLikeURLs:(NSArray *)likeURLs
{
    _likeURLs = likeURLs;
    [self.tableView reloadData];
}

- (IBAction)dismiss:(id)sender
{
    [self.presentingViewController dismissModalViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
    NSLog(@"LikeURLsVC prepareForSegue");
    // prepare segue.destinationController to display based on information
    // about my data structure corresponding to indexPath.row in indexPath.section
    if ([segue.identifier isEqualToString:@"browseURL"]) {
        URLBrowseViewController *browseVC = segue.destinationViewController;
        // send messages to newController to prepare it to appear on screen
        // the segue will do the work of putting the new controller on screen
        NSString *url = [[self.likeURLs objectAtIndex:indexPath.row] objectForKey:@"url"];
        NSLog(@"browse url: %@", url);
        browseVC.urlStr = url;
    }
}
    
- (void)collectLikeURL
{
    // FQL "SELECT url FROM url_like WHERE user_id = me()"
    NSString *query = @"SELECT url FROM url_like WHERE user_id = me()";
    // Set up the query parameter
    NSDictionary *queryParam = [NSDictionary dictionaryWithObjectsAndKeys:query, @"q", nil];
    // Make the API request that uses FQL
    NSLog(@"collectLikeURL");
    [FBRequestConnection startWithGraphPath:@"/fql"
                                 parameters:queryParam
                                 HTTPMethod:@"GET"
                          completionHandler:^(FBRequestConnection *connection,
                                              id result,
                                              NSError *error) {
                              if (error) {
                                  NSLog(@"Error: %@", [error localizedDescription]);
                              } else {
                                  NSLog(@"Result: %@", result);
                                  self.likeURLs = (NSArray *) [result objectForKey:@"data"];
                              }
                          }];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self collectLikeURL];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.likeURLs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"URLCell";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[self.likeURLs objectAtIndex:indexPath.row]
                           objectForKey:@"url"];
    /*
     UIImage *image = [UIImage imageWithData:
     [NSData dataWithContentsOfURL:
     [NSURL URLWithString:
     [[self.likeURLs objectAtIndex:indexPath.row]
     objectForKey:@"pic_square"]]]];
     cell.imageView.image = image;
     */
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
