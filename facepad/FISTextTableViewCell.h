//
//  FISTextTableViewCell.h
//  facepad
//
//  Created by Matt Amerige on 6/25/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISTextTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *profileUsername;
@property (weak, nonatomic) IBOutlet UILabel *postContent;


@end
