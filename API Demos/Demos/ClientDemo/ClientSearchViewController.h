//
//  ClientSearchViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 11/24/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClientSearchViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>
{
    UISearchDisplayController *searchDisplayController;
    UIAlertView *progressDialog;
}

@property (nonatomic, strong) NSArray *results;
@end
