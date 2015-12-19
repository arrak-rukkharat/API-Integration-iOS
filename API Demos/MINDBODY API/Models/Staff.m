//
//  Staff.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 7/23/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Staff.h"

@implementation Staff

- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"AppointmentTrn"])
    {
        self.AppointmentTrn = [string boolValue];
    }
    else if ([element isEqualToString:@"ReservationTrn"])
    {
        self.ReservationTrn = [string boolValue];
    }
    else if ([element isEqualToString:@"IndependentContractor"])
    {
        self.IndependentContractor = [string boolValue];
    }
    else if ([element isEqualToString:@"AlwaysAllowDoubleBooking"])
    {
        self.AlwaysAllowDoubleBooking = [string boolValue];
    }
    else if ([element isEqualToString:@"ID"])
    {
        self.ID = string;
    }
    else if ([element isEqualToString:@"Name"])
    {
        self.Name = [Utils concate:self.Name :string];
    }
    else if ([element isEqualToString:@"FirstName"])
    {
        self.FirstName = [Utils concate:self.FirstName :string];
    }
    else if ([element isEqualToString:@"LastName"])
    {
        self.LastName = [Utils concate:self.LastName :string];
    }
    else if ([element isEqualToString:@"isMale"])
    {
        self.isMale = [string boolValue];
    }
    else if ([element isEqualToString:@"Email"])
    {
        self.Email = [Utils concate:self.Email :string];
    }
    else if ([element isEqualToString:@"MobilePhone"])
    {
        self.MobilePhone = string;
    }
    else if ([element isEqualToString:@"HomePhone"])
    {
        self.HomePhone = string;
    }
    else if ([element isEqualToString:@"WorkPhone"])
    {
        self.WorkPhone = string;
    }
    else if ([element isEqualToString:@"Address"])
    {
        self.Address = [Utils concate:self.Address :string];
    }
    else if ([element isEqualToString:@"Address2"])
    {
        self.Address2 = [Utils concate:self.Address2 :string];
    }
    else if ([element isEqualToString:@"City"])
    {
        self.City = [Utils concate:self.City :string];
    }
    else if ([element isEqualToString:@"State"])
    {
        self.State = string;
    }
    else if ([element isEqualToString:@"Country"])
    {
        self.Country = [Utils concate:self.Country :string];
    }
    else if ([element isEqualToString:@"PostalCode"])
    {
        self.PostalCode = [Utils concate:self.PostalCode :string];
    }
    else if ([element isEqualToString:@"ForeignZip"])
    {
        self.ForeignZip = [Utils concate:self.ForeignZip :string];
    }
    else if ([element isEqualToString:@"Bio"])
    {
        self.Bio = [Utils concate:self.Bio :string];
    }
    else if ([element isEqualToString:@"ImageURL"])
    {
        self.ImageURL = [Utils concate:self.ImageURL :string];
    }
}

- (void)finish
{
    
}

@end
