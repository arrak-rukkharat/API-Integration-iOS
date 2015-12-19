//
//  NewClientViewController.h
//  API Demos
//
//  Created by Blackbolt on 11/19/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewClientViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *spinner;
@property (nonatomic, strong) IBOutlet UITextField *tfFirst;
@property (nonatomic, strong) IBOutlet UITextField *tfLast;
@property (nonatomic, strong) IBOutlet UITextField *tfEmail;
@property (nonatomic, strong) IBOutlet UITextField *tfPass;
@property (nonatomic, strong) IBOutlet UIButton *btSubmit;
@property (nonatomic, strong) IBOutlet UIButton *btClear;
@property (nonatomic, strong) IBOutlet UILabel *lbResult;

- (IBAction)submit:(id)sender;
- (IBAction)clear:(id)sender;

@end
