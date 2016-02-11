//
//  ClientServicesViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 11/25/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClientServicesViewController : UITableViewController
{
    NSArray *services;
    NSArray *allServices;
    NSArray *memberships;
    NSMutableArray *activeServices;
    BOOL showActiveOnly;
}

- (id)initWithClientID:(NSString*)clientID;

@end
