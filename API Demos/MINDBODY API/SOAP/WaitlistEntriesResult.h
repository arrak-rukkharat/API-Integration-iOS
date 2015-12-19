//
//  WaitlistEntriesResult.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/21/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface WaitlistEntriesResult : MBResult
{
    Staff *staff;
    ClassSchedule *sch;
    NSMutableArray *wl;
    Location *loc, *cloc;
    ServiceCategory *prg;
    ClassDescription *classDes;
    SessionType *sess;
    WaitlistEntry *we;
    Client *client;
}

@property(nonatomic, strong) NSArray *WaitlistEntries;

@end
