//
//  StaffScheduleViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 11/20/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>

//  next 30 days
#define FUTURE_TIME 24*60*60*30
@interface StaffScheduleViewController : UITableViewController
{
    NSArray *list;
    NSString *currentStaffID;
    NSString *noItemText;
}

- (id)initWithStaffID:(NSString*)staffID;

@end
