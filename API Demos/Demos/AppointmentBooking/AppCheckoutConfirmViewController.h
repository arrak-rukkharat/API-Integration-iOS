//
//  AppCheckoutConfirmViewController.h
//  API Demos
//
//  Created by Blackbolt on 12/10/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBAPI.h"

@interface AppCheckoutConfirmViewController : UIViewController<UIAlertViewDelegate>
{
    NSString *checkoutServiceID;
    NSString *checkoutClientID;
    NSString *checkoutTotal;
    ScheduleItem *checkoutSchedule;
    UIAlertView *progressDialog;
}

@property(nonatomic, strong) IBOutlet UILabel *lbService;
@property(nonatomic, strong) IBOutlet UILabel *lbClient;
@property(nonatomic, strong) IBOutlet UILabel *lbStaff;
@property(nonatomic, strong) IBOutlet UILabel *lbTime;
@property(nonatomic, strong) IBOutlet UILabel *lbLocation;
@property(nonatomic, strong) IBOutlet UILabel *lbTotal;
@property(nonatomic, strong) IBOutlet UIButton *btPay;


- (IBAction)pay:(id)sender;
- (id)initWithScheduleItem:(ScheduleItem*)schedule clientID:(NSString*)clientID serviceID:(NSString*)serviceID total:(NSString*)total;
@end
