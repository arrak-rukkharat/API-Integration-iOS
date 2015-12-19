//
//  ClassPassViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 12/1/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBAPI.h"

#define UNDEFINED 9999

@interface ApptCheckoutViewController : UITableViewController<UIAlertViewDelegate>
{
    NSArray *sessionTypes;
    NSString *currentClientID;
    NSString *sessionTypeID;
    NSString *currentPassID;
    UIAlertView *progressDialog;
    ScheduleItem *schedule;
    
    // Current cart items
    NSMutableArray *cartItems;
    
    // Store the grand total
    NSString *grandTotal;
}

- (id)initWithSessionTypeID:(NSString*)prgID ClientID:(NSString*)clientID schduleItem:(ScheduleItem*)scheduleItem;
@end
