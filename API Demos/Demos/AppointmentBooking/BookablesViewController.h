//
//  BookablesViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 12/2/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>

// Schedules for the next 7 days
#define TENDAY_INCREMENT 24*60*60*7

@interface BookablesViewController : UITableViewController
{
    NSArray *sessions;
    NSString *clientID;
    NSString *sessionTypeID;
    NSDate *startDate;
    NSDate *endDate;
    NSMutableArray *sessionTypeIDs;
    NSString *headerTitle;
    UIAlertView *progressDialog;
}

- (id)initWithClientIDOrNil:(NSString*)clientIDForBooking sessiontypeID:(NSString*)sessionID sessionTitle:(NSString*)title pageTitle:(NSString*)pageTitle;
@end
