//
//  FISUser.h
//  facepad
//
//  Created by Matt Amerige on 6/24/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISUser : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) UIImage *profilePic;
@property (nonatomic, strong) UIImage *cover;
@property (nonatomic, strong) NSMutableArray *posts;

- (instancetype)initWithUsername:(NSString *)username profilePicture:(UIImage *)profilePicture coverImage:(UIImage *)coverImage;

- (void)addTextPost:(NSString *)content;
- (void)addImagePost:(UIImage *)image;

@end
