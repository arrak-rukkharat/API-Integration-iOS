//
//  StaffViewController.m
//  API Demos
//
//  Created by Arrak Rukkharat on 11/20/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "StaffViewController.h"
#import "StaffScheduleViewController.h"

@interface StaffViewController ()

@end

@implementation StaffViewController

- (id)initWithStaff:(Staff*)staff
{
    if (self = [super init])
    {
        [self setTitle:@"Staff Detail"];
        trainer = staff;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    self.ivImage.layer.cornerRadius = self.ivImage.frame.size.height / 2;
    self.ivImage.layer.masksToBounds = YES;
    self.ivImage.layer.borderWidth = 0;
    
    if (trainer)
    {
        self.lbFullName.text = [NSString stringWithFormat:@"%@ %@", trainer.FirstName, trainer.LastName];
        self.lbEmail.text = trainer.Email;
        self.lbGender.text = trainer.isMale ? @"M" : @"F";
        self.lbPhone.text = trainer.MobilePhone;
        self.lbTeacher.text = (trainer.ReservationTrn || trainer.AppointmentTrn) ? @"Yes" : @"No";
        
        if (trainer.ImageURL)
        {
            NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:trainer.ImageURL]];
            [self.ivImage setImage:[UIImage imageWithData:imgData scale:1.0]];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewSchedule:(id)sender
{
    StaffScheduleViewController *vc = [[StaffScheduleViewController alloc] initWithStaffID:trainer.ID];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
