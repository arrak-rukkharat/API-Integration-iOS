//
//  Location.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/26/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Location.h"

@implementation Location

- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"BusinessID"])
    {
        self.BusinessID = [string intValue];
    }
    else if ([element isEqualToString:@"SiteID"])
    {
        self.SiteID = [string intValue];
    }
    else if ([element isEqualToString:@"BusinessDescription"])
    {
        self.BusinessDescription = [Utils concate:self.BusinessDescription :string];
    }
    else if ([element isEqualToString:@"FacilitySquareFeet"])
    {
        self.FacilitySquareFeet = [string intValue];
    }
    else if ([element isEqualToString:@"TreatmentRooms"])
    {
        self.TreatmentRooms = [string intValue];
    }
    else if ([element isEqualToString:@"ProSpaFinderSite"])
    {
        self.ProSpaFinderSite = [string boolValue];
    }
    else if ([element isEqualToString:@"HasClasses"])
    {
        self.HasClasses = [string boolValue];
    }
    else if ([element isEqualToString:@"PhoneExtension"])
    {
        self.PhoneExtension = string;
    }
    else if ([element isEqualToString:@"ID"])
    {
        self.ID = string;
    }
    else if ([element isEqualToString:@"Name"])
    {
        self.Name = string;
    }
    else if ([element isEqualToString:@"Address"])
    {
        self.Address = string;
    }
    else if ([element isEqualToString:@"Address2"])
    {
        self.Address2 = string;
    }
    else if ([element isEqualToString:@"Tax1"])
    {
        self.Tax1 = [string doubleValue];
    }
    else if ([element isEqualToString:@"Tax2"])
    {
        self.Tax2 = [string doubleValue];
    }
    else if ([element isEqualToString:@"Tax3"])
    {
        self.Tax3 = [string doubleValue];
    }
    else if ([element isEqualToString:@"Tax4"])
    {
        self.Tax4 = [string doubleValue];
    }
    else if ([element isEqualToString:@"Tax5"])
    {
        self.Tax5 = [string doubleValue];
    }
    else if ([element isEqualToString:@"Phone"])
    {
        self.Phone = string;
    }
    else if ([element isEqualToString:@"City"])
    {
        self.City = string;
    }
    else if ([element isEqualToString:@"StateProvCode"])
    {
        self.StateProvCode = string;
    }
    else if ([element isEqualToString:@"PostalCode"])
    {
        self.PostalCode = string;
    }
    else if ([element isEqualToString:@"Latitude"])
    {
        self.Latitude = [string doubleValue];
    }
    else if ([element isEqualToString:@"Longitude"])
    {
        self.Longitude = [string doubleValue];
    }
    else if ([element isEqualToString:@"DistanceInMiles"])
    {
        self.DistanceInMiles = [string doubleValue];
    }
    else if ([element isEqualToString:@"ImageURL"])
    {
        self.ImageURL = string;
    }
    else if ([element isEqualToString:@"Description"])
    {
        self.Description = string;
    }
    else if ([element isEqualToString:@"HasSite"])
    {
        self.HasSite = [string boolValue];
    }
    else if ([element isEqualToString:@"CanBook"])
    {
        self.CanBook = [string boolValue];
    }
}

- (void)finish {}

@end
