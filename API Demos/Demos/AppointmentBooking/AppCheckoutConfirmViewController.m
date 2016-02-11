//
//  AppCheckoutConfirmViewController.m
//  API Demos
//
//  Created by Blackbolt on 12/10/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "AppCheckoutConfirmViewController.h"

@interface AppCheckoutConfirmViewController ()

@end

@implementation AppCheckoutConfirmViewController


- (id)initWithScheduleItem:(ScheduleItem*)schedule clientID:(NSString*)clientID serviceID:(NSString*)serviceID total:(NSString*)total
{
    if (self = [super init])
    {
        [self setTitle:@"Confirm Payment"];
        
        checkoutSchedule = schedule;
        checkoutClientID = clientID;
        checkoutServiceID = serviceID;
        checkoutTotal = total;
        
        progressDialog = [[UIAlertView alloc] init];
        progressDialog.message = @"Processing...";
        
        [self loadClient];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.lbService.text = checkoutSchedule.SessionType.Name;
    self.lbStaff.text = [NSString stringWithFormat:@"%@ %@", checkoutSchedule.Staff.FirstName, checkoutSchedule.Staff.LastName];
    self.lbTime.text = [Utils dateToString:checkoutSchedule.StartDateTime format:@"MMMM dd, yyyy - hh:mm a"];
    self.lbLocation.text = checkoutSchedule.Location.Name;
    self.lbTotal.text =  [NSString stringWithFormat:@"$%.2f", [checkoutTotal floatValue]];
}

- (void)loadClient
{
    NSArray *clientID = [[NSArray alloc] initWithObjects:checkoutClientID, nil];
    [ClientService GetClientsByIDs:clientID withBlock:^(ClientsResult *result)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (result.ErrorCode == 200)
            {
                Client *client = (Client*)result.Clients.firstObject;
                self.lbClient.text = [NSString stringWithFormat:@"%@ %@", client.FirstName, client.LastName];
            }
            else
            {
                self.lbClient.text = @"-";
            }
        });
    }];
}

- (IBAction)pay:(id)sender
{
    [progressDialog show];
    
    PaymentInfo *payment;
    
    // Use the client account
    payment = [PaymentInfoAccount new];
    payment.AmountTotal = checkoutTotal;
    payment.SendEmail = NO;
    
    if ([checkoutTotal floatValue] == 0.0)
    {
        // Cash payment if the amount is zero
        payment = [PaymentInfoCash new];
        payment.AmountTotal = checkoutTotal;
        payment.SendEmail = NO;
    }
    
    [SaleService BuyAndBookAnAppointmentWithSchedule:checkoutSchedule serviceID:checkoutServiceID withPayment:payment forClientID:checkoutClientID withBlock:^(ReceiptResult *result)
     {
         dispatch_async(dispatch_get_main_queue(), ^{
             
             [progressDialog dismissWithClickedButtonIndex:0 animated:YES];
             
             if (result.ErrorCode == 200)
             {
                 UIAlertView *confirmDialog = [[UIAlertView alloc] initWithTitle:@"Done"
                                                                         message:@"Booking completed!"
                                                                        delegate:self
                                                               cancelButtonTitle:@"Close"
                                                               otherButtonTitles:nil];
                 [confirmDialog setTag:1];
                 [confirmDialog show];
             }
             else
             {
                 UIAlertView *confirmDialog = [[UIAlertView alloc] initWithTitle:@"Fail"
                                                                         message:@"Problem occured while booking."
                                                                        delegate:self
                                                               cancelButtonTitle:@"Close"
                                                               otherButtonTitles:nil];
                 [confirmDialog setTag:1];
                 [confirmDialog show];
             }
         });
     }];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1)
    {
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
}

@end
