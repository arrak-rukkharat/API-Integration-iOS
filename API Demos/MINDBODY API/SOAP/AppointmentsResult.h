//
//  AppointmentsResult.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 11/4/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface AppointmentsResult : MBResult
{
    NSMutableArray *appts;
    Appointment *a;
    ServiceCategory *prg;
    SessionType *sess;
    Location *loc;
    Staff *staff;
    Client *c;
    PurchasedService *service;
    NSMutableArray *resources;
}

/// Collection of <Appointment>
@property (nonatomic, strong) NSArray *Appointments;

@end
