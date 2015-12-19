//
//  ClassCheckoutViewController.h
//  API Demos
//
//  Created by Blackbolt on 12/13/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBAPI.h"
#import "ClassCheckoutConfirmViewController.h"

@interface ClassCheckoutViewController : UITableViewController
{
    NSArray *services;
    NSString *currentClientID;
    NSString *currentClassID;
    UIAlertView *progressDialog;
    
    // Store the class, so that we can use it in children view controllers
    C1ass *currentClass;
    
    NSMutableArray *cartItems;
}

- (id)initWithClass:(C1ass*)class ClientID:(NSString*)clientID;
@end
