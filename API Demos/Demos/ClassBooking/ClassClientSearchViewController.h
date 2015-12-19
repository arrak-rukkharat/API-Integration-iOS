//
//  ClassClientSearchViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 12/1/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassPassViewController.h"
#import "ClassViewController.h"
@interface ClassClientSearchViewController : UITableViewController
{
    UISearchDisplayController *searchDisplayController;
    UIAlertView *progressDialog;
}

@property (nonatomic, strong) NSArray *results;
@end
