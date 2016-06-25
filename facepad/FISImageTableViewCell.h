//
//  FISImageTableViewCell.h
//  facepad
//
//  Created by Matt Amerige on 6/25/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISImageTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;
@property (weak, nonatomic) IBOutlet UILabel *profileUsername;


@end
