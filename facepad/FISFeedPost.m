//
//  FISFeedPost.m
//  facepad
//
//  Created by Matt Amerige on 6/24/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISFeedPost.h"

@implementation FISFeedPost

- (instancetype)init
{
    return [self initWithAuthor:nil];
}

- (instancetype)initWithAuthor:(FISUser *)author
{
    if (!(self = [super init])) {
        return nil;
    }
    
    _user = author;
    
    return self;
}

@end
