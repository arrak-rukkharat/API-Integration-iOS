//
//  NewClientViewController.m
//  API Demos
//
//  Created by Blackbolt on 11/19/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "NewClientViewController.h"
#import "MBAPI.h"

@implementation NewClientViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"New Client"];
    
    [self.spinner startAnimating];
    [self.spinner setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender
{
    if ([self.tfFirst.text isEqualToString:@""] ||
        [self.tfFirst.text isEqualToString:@""] ||
        [self.tfFirst.text isEqualToString:@""] ||
        [self.tfFirst.text isEqualToString:@""] )
    {
        [self showMessage:@"Missing information"];
        return;
    }
    
    [self showSpinner];
    
    Client *client = [Client new];
    client.FirstName = [self.tfFirst.text isEqualToString:@""] ? nil : self.tfFirst.text;
    client.LastName = [self.tfLast.text isEqualToString:@""] ? nil : self.tfLast.text;
    client.Email = [self.tfEmail.text isEqualToString:@""] ? nil : self.tfEmail.text;
    client.Password = [self.tfPass.text isEqualToString:@""] ? nil : self.tfPass.text;
    
    [ClientService AddClient:client withBlock:^(ClientResult *result)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (result.ErrorCode == 200)
            {
                [self showMessage:@"Client has been added successfully!"];
            }
            else
            {
                [self showMessage:@"Failed to add client. Try check the required fields on your studio."];
            }
            
            [self hideSpinner];
            [self clearAll];
        });
        
    }];
}

- (IBAction)clear:(id)sender
{
    [self clearAll];
}

- (void)clearAll
{
    self.tfFirst.text = @"";
    self.tfLast.text = @"";
    self.tfEmail.text = @"";
    self.tfPass.text = @"";
}

- (void)showMessage:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)showSpinner
{
    [self.view setUserInteractionEnabled:NO];
    [self.spinner setHidden:NO];
}

- (void)hideSpinner
{
    [self.view setUserInteractionEnabled:YES];
    [self.spinner setHidden:YES];
}

@end
