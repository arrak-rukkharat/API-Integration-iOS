//
//  SPTCell.h
//  SampleListApp
//
//  Created by Arrak Rukkharat on 5/25/14.
//  Copyright (c) 2014 Kanya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCell : UITableViewCell
+(UITableViewCell *) cellFromNibNamed:(NSString *)nibName;

// Details of the cell
@property (nonatomic, strong) id delegate;
@property (nonatomic, strong) IBOutlet UILabel *title;
@property (nonatomic, strong) IBOutlet UILabel *subtitle;
@property (nonatomic, strong) IBOutlet UILabel *lbCapacity;
@property (nonatomic, strong) IBOutlet UIProgressView *pvCapacity;

@end
