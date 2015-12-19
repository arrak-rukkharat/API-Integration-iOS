//
//  StaffViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 11/20/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBAPI.h"

@interface StaffViewController : UIViewController
{
    Staff *trainer;
}

@property (nonatomic, strong) IBOutlet UILabel *lbGender;
@property (nonatomic, strong) IBOutlet UILabel *lbEmail;
@property (nonatomic, strong) IBOutlet UILabel *lbPhone;
@property (nonatomic, strong) IBOutlet UILabel *lbTeacher;
@property (nonatomic, strong) IBOutlet UILabel *lbFullName;

@property (nonatomic, strong) IBOutlet UITextView *tvBio;
@property (nonatomic, strong) IBOutlet UIImageView *ivImage;
@property (nonatomic, strong) IBOutlet UIButton *btSchedule;

- (IBAction)viewSchedule:(id)sender;
- (id)initWithStaff:(Staff*)staff;
@end
