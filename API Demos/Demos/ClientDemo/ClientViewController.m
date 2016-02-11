//
//  ClientViewController.m
//  API Demos
//
//  Created by Arrak Rukkharat on 11/24/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientViewController.h"
#import "ClientVisitsViewController.h"
#import "ClientScheduleViewController.h"
#import "PurchasesViewController.h"
#import "ClientServicesViewController.h"

@interface ClientViewController ()

@end

@implementation ClientViewController

- (id)initWithClientID:(NSString*)clientID
{
    if (self = [super init])
    {
        [self setTitle:@"Client Detail"];
        
        [ClientService GetClientsByIDs:[[NSArray alloc] initWithObjects:clientID, nil] withBlock:^(ClientsResult *result)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (result.ErrorCode == 200 && result.Clients && result.Clients.count > 0)
                {
                    self.client = (Client*)result.Clients.firstObject;
                    [self updateUI];
                }
            });
        }];
        
        [ClientService GetAccountBalancesWithClientID:clientID withBlock:^(ClientAccountBalancesResult *result)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (result.ErrorCode == 200)
                {
                    self.lbBalance.text = result.AccountBalance;
                }
            });
        }];

    }
    return self;
}

- (IBAction)btSchedule:(id)sender
{
    ClientScheduleViewController *vc = [[ClientScheduleViewController alloc] initWithClientID:self.client.ID];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)btServices:(id)sender
{
    ClientServicesViewController *vc = [[ClientServicesViewController alloc] initWithClientID:self.client.ID];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)btPastVisits:(id)sender
{
    ClientVisitsViewController *vc = [[ClientVisitsViewController alloc] initWithClientID:self.client.ID];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)btPurchases:(id)sender
{
    PurchasesViewController *vc = [[PurchasesViewController alloc] initWithClientID:self.client.ID];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.ivImage.layer.cornerRadius = self.ivImage.frame.size.height / 2;
    self.ivImage.layer.masksToBounds = YES;
    self.ivImage.layer.borderWidth = 0;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}

- (void)updateUI
{
    self.lbFullName.text = [NSString stringWithFormat:@"%@ %@", self.client.FirstName, self.client.LastName];
    self.lbGender.text = self.client.Gender;
    self.lbEmail.text = self.client.Email;
    self.lbPhone.text = self.client.MobilePhone;
    
    if (self.client.PhotoURL)
    {
        NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.client.PhotoURL]];
        [self.ivImage setImage:[UIImage imageWithData:imgData scale:1.0]];
    }
}

- (IBAction)viewSchedule:(id)sender
{
    
}


@end
