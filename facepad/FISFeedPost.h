//
//  FISFeedPost.h
//  facepad
//
//  Created by Matt Amerige on 6/24/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISUser.h"

@interface FISFeedPost : NSObject

@property (nonatomic, strong) FISUser *user;
@property (nonatomic, strong) NSDate *postedDate;

- (instancetype)initWithAuthor:(FISUser *)author;

@end
