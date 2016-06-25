//
//  FISUser.m
//  facepad
//
//  Created by Matt Amerige on 6/24/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISUser.h"
#import "FISTextPost.h"
#import "FISImagePost.h"

@implementation FISUser

- (instancetype)init
{
    return [self initWithUsername:@"NAME NOT SET" profilePicture:nil coverImage:nil];
}

- (instancetype)initWithUsername:(NSString *)username profilePicture:(UIImage *)profilePicture coverImage:(UIImage *)coverImage
{
    if (!(self = [super init])) {
        return nil;
    }
    
    _username = username;
    _profilePic = profilePicture;
    _cover = coverImage;
    _posts = [[NSMutableArray alloc] init];
    
    return self;
}

- (void)addTextPost:(NSString *)content
{
    FISTextPost *post = [[FISTextPost alloc] initWithAuthor:self];
    post.postedDate = [NSDate date];
    post.textContent = content;
    
    [self.posts addObject:post];
    
}

- (void)addImagePost:(UIImage *)image
{
    FISImagePost *post = [[FISImagePost alloc] initWithAuthor:self];
    post.postedDate = [NSDate date];
    post.imageContent = image;
    
    [self.posts addObject:post];
}


@end





