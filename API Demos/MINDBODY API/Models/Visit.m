//
//  Visit.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/4/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Visit.h"

@implementation Visit

- (void)mapElement:(NSString*)element with:(NSString*)string
{
    if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"ClassID"])
    {
        self.ClassID = [Utils concate:self.ClassID :string];
    }
    else if ([element isEqualToString:@"AppointmentID"])
    {
        self.AppointmentID = [Utils concate:self.AppointmentID :string];
    }
    else if ([element isEqualToString:@"StartDateTime"])
    {
        startTime = [Utils concate:startTime :string];
    }
    else if ([element isEqualToString:@"LateCancelled"])
    {
        self.LateCancelled = [string boolValue];
    }
    else if ([element isEqualToString:@"EndDateTime"])
    {
        endTime = [Utils concate:endTime :string];
    }
    else if ([element isEqualToString:@"Name"])
    {
        self.Name = [Utils concate:self.Name :string];
    }
    else if ([element isEqualToString:@"WebSignup"])
    {
        self.WebSignup = [string boolValue];
    }
    else if ([element isEqualToString:@"SignedIn"])
    {
        self.SignedIn = [string boolValue];
    }
    else if ([element isEqualToString:@"MakeUp"])
    {
        self.MakeUp = [string boolValue];
    }
}

- (void)finish
{
    self.StartDateTime = [Utils convertISOToDate:startTime];
    self.EndDateTime = [Utils convertISOToDate:endTime];
}

@end
