//
//  Class.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 9/25/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "C1ass.h"

@implementation C1ass

- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"ClassScheduleID"])
    {
        self.ClassScheduleID = [Utils concate:self.ClassScheduleID :string];
    }
    else if ([element isEqualToString:@"MaxCapacity"])
    {
        self.MaxCapacity = string.intValue;
    }
    else if ([element isEqualToString:@"WebCapacity"])
    {
        self.WebCapacity = string.intValue;
    }
    else if ([element isEqualToString:@"TotalBooked"])
    {
        self.TotalBooked = string.intValue;
    }
    else if ([element isEqualToString:@"TotalBookedWaitlist"])
    {
        self.TotalBookedWaitlist = string.intValue;
    }
    else if ([element isEqualToString:@"WebBooked"])
    {
        self.WebBooked = string.boolValue;
    }
    else if ([element isEqualToString:@"SemesterID"])
    {
        self.SemesterID = [Utils concate:self.SemesterID :string];
    }
    else if ([element isEqualToString:@"IsCanceled"])
    {
        self.IsCanceled = string.boolValue;
    }
    else if ([element isEqualToString:@"Substitute"])
    {
        self.Substitute = string.boolValue;
    }
    else if ([element isEqualToString:@"Active"])
    {
        self.Active = string.boolValue;
    }
    else if ([element isEqualToString:@"IsWaitlistAvailable"])
    {
        self.IsWaitlistAvailable = string.boolValue;
    }
    else if ([element isEqualToString:@"IsEnrolled"])
    {
        self.IsEnrolled = string.boolValue;
    }
    else if ([element isEqualToString:@"HideCancel"])
    {
        self.HideCancel = string.boolValue;
    }
    else if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"IsAvailable"])
    {
        self.IsAvailable = string.boolValue;
    }
    else if ([element isEqualToString:@"StartDateTime"])
    {
        startDateString = [Utils concate:startDateString :string];
    }
    else if ([element isEqualToString:@"EndDateTime"])
    {
        endDateString = [Utils concate:endDateString :string];
    }
}

- (void)finish
{
    self.StartDateTime = [Utils convertISOToDate:startDateString];
    self.EndDateTime = [Utils convertISOToDate:endDateString];
}

@end
