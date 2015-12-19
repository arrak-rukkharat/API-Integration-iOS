//
//  Client.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/31/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Client.h"

@implementation Client


- (id)init
{
    if (self = [super init])
    {
        _IsCompanySpecified = NO;
        _LiabilityReleaseSpecified = NO;
        _EmailOptInSpecified = NO;
        _IsProspectSpecified = NO;
        _InactiveSpecified = NO;
        _PromotionalEmailOptInSpecified = NO;
        
    }
    return self;
}

- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"IsCompany"])
    {
        self.IsCompany = [string boolValue];
    }
    else if ([element isEqualToString:@"LiabilityRelease"])
    {
        self.LiabilityRelease = [string boolValue];
    }
    else if ([element isEqualToString:@"EmailOptIn"])
    {
        self.EmailOptIn = [string boolValue];
    }
    else if ([element isEqualToString:@"IsProspect"])
    {
        self.IsProspect = [string boolValue];
    }
    else if ([element isEqualToString:@"PromotionalEmailOptIn"])
    {
        self.PromotionalEmailOptIn = [string boolValue];
    }
    else if ([element isEqualToString:@"ID"])
    {
        self.ID = string;
    }
    else if ([element isEqualToString:@"FirstName"])
    {
        self.FirstName = [Utils concate:self.FirstName :string];
    }
    else if ([element isEqualToString:@"LastName"])
    {
        self.LastName = [Utils concate:self.LastName :string];
    }
    else if ([element isEqualToString:@"Gender"])
    {
        self.Gender = string;
    }
    else if ([element isEqualToString:@"Email"])
    {
        self.Email = [Utils concate:self.Email :string];
    }
    else if ([element isEqualToString:@"MobilePhone"])
    {
        self.MobilePhone = [Utils concate:self.MobilePhone :string];
    }
    else if ([element isEqualToString:@"HomePhone"])
    {
        self.HomePhone = [Utils concate:self.HomePhone :string];
    }
    else if ([element isEqualToString:@"WorkPhone"])
    {
        self.WorkPhone = [Utils concate:self.WorkPhone :string];
    }
    else if ([element isEqualToString:@"AddressLine1"])
    {
        self.AddressLine1 = [Utils concate:self.AddressLine1 :string];
    }
    else if ([element isEqualToString:@"AddressLine2"])
    {
        self.AddressLine2 = [Utils concate:self.AddressLine2 :string];
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
        self.Country = string;
    }
    else if ([element isEqualToString:@"PostalCode"])
    {
        self.PostalCode = [Utils concate:self.PostalCode :string];
    }
    else if ([element isEqualToString:@"Country"])
    {
        self.Country = string;
    }
    else if ([element isEqualToString:@"YellowAlert"])
    {
        self.YellowAlert = [Utils concate:self.YellowAlert :string];
    }
    else if ([element isEqualToString:@"RedAlert"])
    {
        self.RedAlert = [Utils concate:self.RedAlert :string];
    }
    else if ([element isEqualToString:@"Notes"])
    {
        self.Notes = [Utils concate:self.Notes :string];
    }
    else if ([element isEqualToString:@"Username"])
    {
        self.Username = [Utils concate:self.Username :string];
    }
    else if ([element isEqualToString:@"AppointmentGenderPreference"])
    {
        self.AppointmentGenderPreference = string;
    }
    else if ([element isEqualToString:@"ReferredBy"])
    {
        self.ReferredBy = [Utils concate:self.ReferredBy :string];
    }
    else if ([element isEqualToString:@"EmergencyContactInfoName"])
    {
        self.EmergencyContactInfoName = [Utils concate:self.EmergencyContactInfoName :string];;
    }
    else if ([element isEqualToString:@"EmergencyContactInfoRelationship"])
    {
        self.EmergencyContactInfoRelationship = string;
    }
    else if ([element isEqualToString:@"EmergencyContactInfoPhone"])
    {
        self.EmergencyContactInfoPhone = [Utils concate:self.EmergencyContactInfoPhone :string];
    }
    else if ([element isEqualToString:@"WorkExtension"])
    {
        self.WorkExtension = [Utils concate:self.WorkExtension :string];;
    }
    else if ([element isEqualToString:@"BirthDate"])
    {
        birthDateString = [Utils concate:birthDateString :string];
    }
    else if ([element isEqualToString:@"FirstAppointmentDate"])
    {
        firstAppointmentDateString = [Utils concate:firstAppointmentDateString :string];
    }
    else if ([element isEqualToString:@"Action"])
    {
        self.Action = [Utils concate:self.Action :string];
    }

}

- (void)finish
{
    self.BirthDate = [Utils convertISOToDate:birthDateString];
    self.FirstAppointmentDate = [Utils convertISOToDate:firstAppointmentDateString];
}

@end
