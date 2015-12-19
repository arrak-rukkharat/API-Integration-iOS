//
//  ApptClientSearchViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 12/2/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApptClientSearchViewController : UITableViewController
{
    UISearchDisplayController *searchDisplayController;
    UIAlertView *progressDialog;
}

@property (nonatomic, strong) NSArray *results;
@end
