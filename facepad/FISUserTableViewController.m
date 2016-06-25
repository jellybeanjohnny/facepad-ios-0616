//
//  FISUserTableViewController.m
//  facepad
//
//  Created by Matt Amerige on 6/24/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISUserTableViewController.h"
#import "FISUser.h"
#import "FISNewsFeedTableViewController.h"

@interface FISUserTableViewController ()

@property (nonatomic, strong) NSArray *users;

@end

@implementation FISUserTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self _generateDummyUsers];
    
}

- (void)_generateDummyUsers
{
    FISUser *annoyingDog = [[FISUser alloc] initWithUsername:@"Annoying Dog"
                                              profilePicture:[UIImage imageNamed:@"annoyingdog"]
                                                  coverImage:[UIImage imageNamed:@"landscape1.jpeg"]];
    
    [annoyingDog addTextPost:@"I am an annoying dog"];
    [annoyingDog addImagePost:[UIImage imageNamed:@"bird1.jpg"]];
    
    
    
    FISUser *kermit = [[FISUser alloc] initWithUsername:@"Kermit"
                                         profilePicture:[UIImage imageNamed:@"kermit.jpeg"]
                                             coverImage:[UIImage imageNamed:@"landscape2.jpeg"]];
    
    [kermit addTextPost:@"I am kermit the frog"];
    [kermit addImagePost:[UIImage imageNamed:@"bird2.jpg"]];
    
    self.users = @[annoyingDog, kermit];
}

#pragma mark - UITableView stuff

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell"];
    
    // get the user associate for this row
    FISUser *user = self.users[indexPath.row];
    
    cell.textLabel.text = user.username;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // get the user object for this cell
    FISUser *selectedUser = self.users[indexPath.row];
    [self performSegueWithIdentifier:@"ShowUserDetail" sender:selectedUser];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowUserDetail"] &&
        [sender isKindOfClass:[FISUser class]]) {
        // cast sender to user
        FISUser *user = (FISUser *)sender;
        FISNewsFeedTableViewController *newsfeedVC = (FISNewsFeedTableViewController *)segue.destinationViewController;
        newsfeedVC.user = user;
    }
}


@end
