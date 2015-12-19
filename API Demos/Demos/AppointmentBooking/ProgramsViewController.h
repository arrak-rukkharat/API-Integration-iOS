//
//  SessionsViewController.h
//  API Demos
//
//  Created by Arrak Rukkharat on 12/3/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgramsViewController : UITableViewController
{
    NSArray *sessions;
    NSString *clientID;
}

- (id)initWithClientIDOrNil:(NSString*)clientID;
@end
