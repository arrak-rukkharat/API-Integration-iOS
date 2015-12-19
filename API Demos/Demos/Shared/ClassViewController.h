//
//  ClassViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 12/1/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBAPI.h"
#import "ListCell.h"

#define DAY_INCREMENT 24*60*60

@interface ClassViewController : UITableViewController
{
    NSArray *classes;
    NSString *clientID;
    NSDate *startDate;
    NSDate *endDate;
    UIAlertView *progressDialog;
}

- (id)initWithClientIDOrNil:(NSString*)clientID;

@end
