//
//  ClassSchedule.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/9/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClassSchedule.h"

@implementation ClassSchedule

- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"SemesterID"])
    {
        self.SemesterID = [Utils concate:self.SemesterID :string];
    }
    else if ([element isEqualToString:@"DaySunday"])
    {
        self.DaySunday = string.boolValue;
    }
    else if ([element isEqualToString:@"DayMonday"])
    {
        self.DayMonday = string.boolValue;
    }
    else if ([element isEqualToString:@"DayTuesday"])
    {
        self.DayTuesday = string.boolValue;
    }
    else if ([element isEqualToString:@"DayWednesday"])
    {
        self.DayWednesday = string.boolValue;
    }
    else if ([element isEqualToString:@"DayThursday"])
    {
        self.DayThursday = string.boolValue;
    }
    else if ([element isEqualToString:@"DayFriday"])
    {
        self.DayFriday = string.boolValue;
    }
    else if ([element isEqualToString:@"DaySaturday"])
    {
        self.DaySaturday = string.boolValue;
    }
    else if ([element isEqualToString:@"AllowOpenEnrollment"])
    {
        self.AllowOpenEnrollment = string.boolValue;
    }
    else if ([element isEqualToString:@"AllowDateForwardEnrollment"])
    {
        self.AllowDateForwardEnrollment = string.boolValue;
    }
    else if ([element isEqualToString:@"IsAvailable"])
    {
        self.IsAvailable = string.boolValue;
    }
    else if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"StartTime"])
    {
        startTime = [Utils concate:startTime :string];
    }
    else if ([element isEqualToString:@"EndTime"])
    {
        endTime = [Utils concate:endTime :string];
    }
    else if ([element isEqualToString:@"StartDate"])
    {
        startDate = [Utils concate:startDate :string];
    }
    else if ([element isEqualToString:@"EndDate"])
    {
        endDate = [Utils concate:endDate :string];
    }
}

- (void)finish
{
    self.StartTime = [Utils convertISOToDate:startTime];
    self.EndTime = [Utils convertISOToDate:endTime];
    self.StartDate = [Utils convertISOToDate:startDate];
    self.EndDate = [Utils convertISOToDate:endDate];
}

@end
