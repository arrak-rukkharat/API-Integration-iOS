//
//  AppointmentResult.h
//  MBAPI
//
//  Created by Blackbolt on 11/5/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface AppointmentResult : MBResult
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

/// The result appointment
@property (nonatomic, strong) Appointment *Appointment;
@end
