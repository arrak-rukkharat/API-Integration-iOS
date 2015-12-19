//
//  ClientViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 11/24/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBAPI.h"
@interface ClientViewController : UIViewController


@property (nonatomic, strong) IBOutlet UILabel *lbBalance;
@property (nonatomic, strong) IBOutlet UILabel *lbGender;
@property (nonatomic, strong) IBOutlet UILabel *lbEmail;
@property (nonatomic, strong) IBOutlet UILabel *lbPhone;
@property (nonatomic, strong) IBOutlet UILabel *lbFullName;

@property (nonatomic, strong) IBOutlet UIImageView *ivImage;
@property (nonatomic, strong) IBOutlet UIButton *btSchedule;
@property (nonatomic, strong) IBOutlet UIButton *btServices;
@property (nonatomic, strong) IBOutlet UIButton *btPastVisits;
@property (nonatomic, strong) IBOutlet UIButton *btPurchases;

@property (nonatomic, strong) Client *client;

- (IBAction)btSchedule:(id)sender;
- (IBAction)btServices:(id)sender;
- (IBAction)btPastVisits:(id)sender;
- (IBAction)btPurchases:(id)sender;
- (id)initWithClientID:(NSString*)clientID;

@end
