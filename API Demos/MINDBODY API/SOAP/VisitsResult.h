//
//  GetClientVisitResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/4/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBResult.h"
#import "Location.h"
#import "Staff.h"
#import "Visit.h"
#import "ServiceCategory.h"

@interface VisitsResult : MBResult
{
    // Temp objects
    Staff *staff;
    Location *loc;
    Visit *visit;
    Client *client;
    Service *service;
    ServiceCategory *Program;
}
/// Collection of Visit
@property (nonatomic, strong) NSMutableArray *Visits;


@end