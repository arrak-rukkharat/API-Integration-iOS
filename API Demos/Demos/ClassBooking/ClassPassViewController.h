//
//  ClassPassViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 12/1/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassPassViewController : UITableViewController<UIAlertViewDelegate>
{
    NSArray *services;
    NSString *currentClientID;
    NSString *currentClassID;
    NSString *currentPassID;
    UIAlertView *progressDialog;
}

- (id)initWithClassID:(NSString*)classID ClientID:(NSString*)clientID;
@end
