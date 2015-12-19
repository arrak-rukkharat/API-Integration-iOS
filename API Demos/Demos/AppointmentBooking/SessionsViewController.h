//
//  SessionsViewController.h
//  API Demos
//
//  Created by Blackbolt on 12/7/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SessionsViewController : UITableViewController
{
    NSArray *sessions;
    NSString *clientID;
    NSString *programID;
    NSString *header;
}

- (id)initWithClientIDOrNil:(NSString*)cltID programID:(NSString*)prgID title:(NSString*)title;
@end
