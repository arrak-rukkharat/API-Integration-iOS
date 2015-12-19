//
//  Appointment.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 11/2/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Appointment.h"

@implementation Appointment
- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"GenderPreference"])
    {
        self.GenderPreference = [Utils concate:self.GenderPreference :string];
    }
    else if ([element isEqualToString:@"Status"])
    {
        self.Status = [Utils concate:self.Status :string];
    }
    else if ([element isEqualToString:@"Duration"])
    {
        self.Duration = string.intValue;
    }
    else if ([element isEqualToString:@"Notes"])
    {
        self.Notes = [Utils concate:self.Notes :string];
    }
    else if ([element isEqualToString:@"ProviderID"])
    {
        self.ProviderID = [Utils concate:self.ProviderID :string];
    }
    else if ([element isEqualToString:@"StaffRequested"])
    {
        self.StaffRequested = string.boolValue;
    }
    else if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"FirstAppointment"])
    {
        self.FirstAppointment = string.boolValue;
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
