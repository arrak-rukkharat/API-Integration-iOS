//
//  ClassCheckoutConfirmViewController.m
//  API Demos
//
//  Created by Blackbolt on 12/13/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClassCheckoutConfirmViewController.h"

@interface ClassCheckoutConfirmViewController ()

@end

@implementation ClassCheckoutConfirmViewController

- (id)initWithClass:(C1ass*)class clientID:(NSString*)clientID service:(Service*)service total:(NSString*)total
{
    if (self = [super init])
    {
        [self setTitle:@"Confirm Payment"];
        
        checkoutClass = class;
        checkoutClientID = clientID;
        checkoutService = service;
        checkoutTotal = total;
        
        progressDialog = [[UIAlertView alloc] init];
        progressDialog.message = @"Processing...";
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    [self loadClient];
    self.lbService.text = checkoutService.Name;
    self.lbStaff.text = [NSString stringWithFormat:@"%@ %@", checkoutClass.Staff.FirstName, checkoutClass.Staff.LastName];
    self.lbTime.text = [Utils dateToString:checkoutClass.StartDateTime format:@"MMMM dd, yyyy - hh:mm a"];
    self.lbLocation.text = checkoutClass.Location.Name;
    self.lbTotal.text =  [NSString stringWithFormat:@"$%.2f", [checkoutTotal floatValue]];
}

- (void)loadClient
{
    NSArray *clientID = [[NSArray alloc] initWithObjects:checkoutClientID, nil];
    [ClientService GetClients:clientID withBlock:^(ClientsResult *result)
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
    
    // Use the client account
    PaymentInfoAccount *payment = [PaymentInfoAccount new];
    payment.AmountTotal = checkoutTotal;
    payment.SendEmail = NO;
    
    [SaleService CheckoutAndEnrollClassID:checkoutClass.ID serviceID:checkoutService.ID withPayment:payment forClientID:checkoutClientID withBlock:^(ReceiptResult *result)
     {
         dispatch_async(dispatch_get_main_queue(), ^{
             
             [progressDialog dismissWithClickedButtonIndex:0 animated:YES];
             
             if (result.ErrorCode == 200)
             {
                 UIAlertView *confirmDialog = [[UIAlertView alloc] initWithTitle:@"Done"
                                                                         message:@"Enrollment completed!"
                                                                        delegate:self
                                                               cancelButtonTitle:@"Close"
                                                               otherButtonTitles:nil];
                 [confirmDialog setTag:1];
                 [confirmDialog show];
             }
             else
             {
                 UIAlertView *confirmDialog = [[UIAlertView alloc] initWithTitle:@"Fail"
                                                                         message:@"Problem occured while enrolling."
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
