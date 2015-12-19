//
//  ClientLoginViewController.m
//  API DEMO
//
//  Created by Arrak Rukkharat on 11/18/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "StaffLoginViewController.h"
#import "MBAPI.h"

@implementation StaffLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"Staff Login"];
    
    self.lbResult.text = @"";
    self.tfPassword.secureTextEntry = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit
{
    
    [StaffService ValidateStaffLoginWithUsername:self.tfUsername.text password:self.tfPassword.text withBlock:^(StaffMemberResult *result)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (result.Staff)
            {
                [self.lbResult setText:@"Valid staff credentials!"];
            }
            else
            {
                [self.lbResult setText:@"Invalid staff credentials"];
            }
        });
    }];
}

@end
