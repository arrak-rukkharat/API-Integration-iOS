//
//  ClientScheduleViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 11/25/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClientScheduleViewController : UITableViewController
{
    NSArray *list;
    NSString *noItemText;
}

- (id)initWithClientID:(NSString*)clientID;

@end
