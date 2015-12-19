//
//  ClientLoginViewController.h
//  API DEMO
//
//  Created by Arrak Rukkharat on 11/18/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaffLoginViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *tfUsername;
@property (nonatomic, strong) IBOutlet UITextField *tfPassword;
@property (nonatomic, strong) IBOutlet UIButton *btSubmit;
@property (nonatomic, strong) IBOutlet UILabel *lbResult;

- (IBAction)submit;

@end
