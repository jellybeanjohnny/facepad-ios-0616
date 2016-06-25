//
//  FISNewsFeedTableViewController.m
//  facepad
//
//  Created by Matt Amerige on 6/25/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISNewsFeedTableViewController.h"
#import "FISCoverImageTableViewCell.h"
#import "FISImageTableViewCell.h"
#import "FISTextTableViewCell.h"
#import "FISTextPost.h"
#import "FISImagePost.h"
#import "FISFeedPost.h"

@interface FISNewsFeedTableViewController ()

@end

@implementation FISNewsFeedTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"User: %@", self.user.username);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Adding one because we have to account for the first header cell
    return self.user.posts.count + 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > 0) {
        FISFeedPost *genericPost = self.user.posts[indexPath.row - 1];
        if ([genericPost isKindOfClass:[FISTextPost class]]) {
            return 110;
        }
        else if ([genericPost isKindOfClass:[FISImagePost class]]) {
            // setup an image post
            return 242;
        }
    }
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if (indexPath.row == 0) {
        // Setup a header cell
        cell = [self _headerCellForTableView:tableView];
    }
    else {
        // get the post object for this row
        FISFeedPost *genericPost = self.user.posts[indexPath.row - 1];
        if ([genericPost isKindOfClass:[FISTextPost class]]) {
            // setup a text post
            cell = [self _textCellForTableView:tableView withPost:(FISTextPost *)genericPost];
        }
        else if ([genericPost isKindOfClass:[FISImagePost class]]) {
            // setup an image post
            cell = [self _imageCellForTableView:tableView withPost:(FISImagePost *)genericPost];
        }
    }
    return cell;
}

- (FISCoverImageTableViewCell *)_headerCellForTableView:(UITableView *)tableView
{
    FISCoverImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeaderCell"];
    
    cell.cover.image = self.user.cover;
    
    return cell;
}

- (FISTextTableViewCell *)_textCellForTableView:(UITableView *)tableView withPost:(FISTextPost *)post
{
    FISTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextCell"];
    
    cell.profileUsername.text = self.user.username;
    cell.profilePic.image = self.user.profilePic;
    cell.postContent.text = post.textContent;
    
    return cell;
}

- (FISImageTableViewCell *)_imageCellForTableView:(UITableView *)tableView withPost:(FISImagePost *)post
{
    FISImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
    
    cell.profileUsername.text = self.user.username;
    cell.profilePic.image = self.user.profilePic;
    cell.contentImage.image = post.imageContent;
    
    return cell;
}



@end
