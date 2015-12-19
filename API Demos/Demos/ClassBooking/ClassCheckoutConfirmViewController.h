//
//  ClassCheckoutConfirmViewController.h
//  API Demos
//
//  Created by Blackbolt on 12/13/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBAPI.h"
@interface ClassCheckoutConfirmViewController : UIViewController<UIAlertViewDelegate>
{
    //NSString *checkoutServiceID;
    NSString *checkoutClientID;
    NSString *checkoutTotal;
    C1ass *checkoutClass;
    Service *checkoutService;
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
- (id)initWithClass:(C1ass*)class clientID:(NSString*)clientID service:(Service*)service total:(NSString*)total;
@end
