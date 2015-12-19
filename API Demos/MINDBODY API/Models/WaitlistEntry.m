//
//  WaitlistEntry.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/21/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "WaitlistEntry.h"

@implementation WaitlistEntry

- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"ClassScheduleID"])
    {
        self.ClassScheduleID = [Utils concate:self.ClassScheduleID :string];
    }
    else if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"ClassID"])
    {
        self.ClassID = [Utils concate:self.ClassID :string];
    }
    else if ([element isEqualToString:@"VisitRefNo"])
    {
        self.VisitRefNo = [Utils concate:self.VisitRefNo :string];
    }
    else if ([element isEqualToString:@"Web"])
    {
        self.Web = [string boolValue];
    }
    else if ([element isEqualToString:@"ClassDate"])
    {
        classDateStr = [Utils concate:classDateStr :string];
    }
    else if ([element isEqualToString:@"EnrollmentDateForward"])
    {
        enrollDateStr = [Utils concate:enrollDateStr :string];
    }
    else if ([element isEqualToString:@"RequestDateTime"])
    {
        requestDateStr = [Utils concate:requestDateStr :string];
    }
}

- (void)finish
{
    self.ClassDate = [Utils convertISOToDate:classDateStr];
    self.EnrollmentDateForward = [Utils convertISOToDate:enrollDateStr];
    self.RequestDateTime = [Utils convertISOToDate:requestDateStr];
}

@end

