//
//  StaffMembersViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 11/20/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaffViewController.h"

@interface StaffMembersViewController : UITableViewController
{
    UIAlertView *progressDialog;
}
@property (nonatomic, strong) NSArray *staffList;

@end
