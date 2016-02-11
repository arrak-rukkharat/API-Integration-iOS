//
//  ClientLoginViewController.m
//  API DEMO
//
//  Created by Arrak Rukkharat on 11/18/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientLoginViewController.h"
#import "MBAPI.h"

@implementation ClientLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle:@"Client Login"];
    
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
    NSLog(@"submit");
    [ClientService ValidateLoginWithUsername:self.tfUsername.text password:self.tfPassword.text withBlock:^(ClientResult *result)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (result.Client)
            {
                [self.lbResult setText:@"Valid user credentials!"];
            }
            else
            {
                [self.lbResult setText:@"Invalid user credentials"];
            }
        });
    }];
}

@end
