//
//  XMLAppointmentService.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/28/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "XMLApptService.h"

@implementation XMLApptService

+ (NSURLRequest*)SOAPGetStaffAppointments:(NSString*)apptID staffID:(NSString*)staffID clientID:(NSString*)clientID locationID:(NSString*)locationID startDate:(NSDate*)start endDate:(NSDate*)end
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetStaffAppointments>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    // User credentials
    UserCredentials *user = [UserCredentials sharedInstance];
    if ([user Username] && [user Password] && [user SiteID])
    {
        [soap appendString:@"<StaffCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</StaffCredentials>"];
    }
    
    if (apptID) [soap appendString:[NSString stringWithFormat:@"<AppointmentIDs><int>%@</int><AppointmentIDs>", apptID]];
    
    if (clientID) [soap appendString:[NSString stringWithFormat:@"<ClientIDs><string>%@</string></ClientIDs>", clientID]];
    
    if (locationID) [soap appendString:[NSString stringWithFormat:@"<LocationIDs><int>%@</int></LocationIDs>", locationID]];
    
    if (staffID) [soap appendString:[NSString stringWithFormat:@"<StaffIDs><long>%@</long></StaffIDs>", staffID]];
    
    if (start) [soap appendString:[NSString stringWithFormat:@"<StartDate>%@</StartDate>", [Utils convertDateToISO:start]]];
    if (end) [soap appendString:[NSString stringWithFormat:@"<EndDate>%@</EndDate>", [Utils convertDateToISO:end]]];
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetStaffAppointments></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_APPT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetStaffAppointments"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetBookableItems:(NSString*)apptID staffID:(NSString*)staffID sessionTypeIDs:(NSMutableArray*)sessionTypeIDs locationID:(NSString*)locationID startDate:(NSDate*)start endDate:(NSDate*)end ignoreDefaultSessionLength:(BOOL)ignoreDefaultSessionLength
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetBookableItems>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    
    if (apptID) [soap appendString:[NSString stringWithFormat:@"<AppointmentID>%@<AppointmentID>", apptID]];
    
    if (locationID) [soap appendString:[NSString stringWithFormat:@"<LocationIDs><int>%@</int></LocationIDs>", locationID]];
    
    if (staffID) [soap appendString:[NSString stringWithFormat:@"<StaffIDs><long>%@</long></StaffIDs>", staffID]];
    
    [soap appendString:@"<SessionTypeIDs>"];
    for (NSString *sti in sessionTypeIDs)
    {
        [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", sti]];
    }
    [soap appendString:@"</SessionTypeIDs>"];
    
    [soap appendString:[NSString stringWithFormat:@"<IgnoreDefaultSessionLength>%@</IgnoreDefaultSessionLength>", (ignoreDefaultSessionLength ? @"true" : @"false")]];
    
    if (start) [soap appendString:[NSString stringWithFormat:@"<StartDate>%@</StartDate>", [Utils convertDateToISO:start]]];
    if (end) [soap appendString:[NSString stringWithFormat:@"<EndDate>%@</EndDate>", [Utils convertDateToISO:end]]];
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetBookableItems></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_APPT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetBookableItems"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPAddOrUpdateAppointments:(NSString*)apptID staffID:(NSString*)staffID clientID:(NSString*)clientID locationID:(NSString*)locationID serviceID:(NSString*)serviceID sessionTypeID:(NSString*)sessionTypeID startDateTime:(NSDate*)startTime isUpdating:(BOOL)isUpdating  notes:(NSString*)notes execute:(NSString*)execute sendEmail:(BOOL)sendEmail
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<AddOrUpdateAppointments>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    // User credentials
    UserCredentials *user = [UserCredentials sharedInstance];
    if ([user Username] && [user Password] && [user SiteID])
    {
        [soap appendString:@"<StaffCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</StaffCredentials>"];
    }
    
    [soap appendString:[NSString stringWithFormat:@"<UpdateAction>%@</UpdateAction>", (isUpdating ? @"Fail" : @"AddNew")]];
    
    [soap appendString:[NSString stringWithFormat:@"<SendEmail>%@</SendEmail>", (sendEmail ? @"true" : @"false")]];
    
    [soap appendString:@"<Appointments><Appointment>"];
    
    if (startTime) [soap appendString:[NSString stringWithFormat:@"<StartDateTime>%@</StartDateTime>", [Utils convertDateToISO:startTime]]];
    
    if (locationID) [soap appendString:[NSString stringWithFormat:@"<Location><ID>%@</ID></Location>", locationID]];
    
    if (staffID) [soap appendString:[NSString stringWithFormat:@"<Staff><ID>%@</ID></Staff>", staffID]];
    
    if (clientID) [soap appendString:[NSString stringWithFormat:@"<Client><ID>%@</ID></Client>", clientID]];
    
    if (sessionTypeID) [soap appendString:[NSString stringWithFormat:@"<SessionType><ID>%@</ID></SessionType>", sessionTypeID]];
    
    if (apptID) [soap appendString:[NSString stringWithFormat:@"<ID>%@</ID>", apptID]];
    
    if (notes) [soap appendString:[NSString stringWithFormat:@"<Notes>%@</Notes>", notes]];
    
    if (execute) [soap appendString:[NSString stringWithFormat:@"<Execute>%@</Execute>", execute]];
    
    
    [soap appendString:@"</Appointment></Appointments>"];
    

    
    [soap appendString:@"</Request></GetStaffAppointments></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_APPT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"AddOrUpdateAppointments"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPAddOrUpdateAvailabilities:(NSString*)availabilityID staffID:(NSString*)staffID locationID:(NSString*)locationID serviceCategoryID:(NSString*)programID startDateTime:(NSDate*)startTime endDateTime:(NSDate*)endTime isUpdating:(BOOL)isUpdating notes:(NSString*)notes execute:(NSString*)execute unavailableDescription:(NSString*)unavailableDescription isUnavailable:(BOOL)isUnavailable publicDisplay:(BOOL)publicDisplay daysOfWeek:(NSArray*)daysOfWeek
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<AddOrUpdateAvailabilities>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    
    // User credentials
    UserCredentials *user = [UserCredentials sharedInstance];
    if ([user Username] && [user Password] && [user SiteID])
    {
        [soap appendString:@"<StaffCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</StaffCredentials>"];
    }
    
    [soap appendString:[NSString stringWithFormat:@"<UpdateAction>%@</UpdateAction>", (isUpdating ? @"Fail" : @"AddNew")]];
    
    [soap appendString:[NSString stringWithFormat:@"<UnavailableDescription>%@</UnavailableDescription>", unavailableDescription]];
    
    [soap appendString:[NSString stringWithFormat:@"<IsUnavailable>%@</IsUnavailable>", (isUnavailable ? @"true" : @"false")]];
    
    [soap appendString:[NSString stringWithFormat:@"<PublicDisplay>%@</PublicDisplay>", (publicDisplay ? @"Show" : @"Hide")]];
    
    if (locationID) [soap appendString:[NSString stringWithFormat:@"<LocationID>%@<LocationID>", locationID]];
    
    if (programID) [soap appendString:[NSString stringWithFormat:@"<ProgramIDs><int>%@</int></ProgramIDs>", programID]];
    
    if (availabilityID) [soap appendString:[NSString stringWithFormat:@"<AvailabilityIDs><int>%@</int></AvailabilityIDs>", availabilityID]];
    
    if (staffID) [soap appendString:[NSString stringWithFormat:@"<StaffIDs><long>%@</long></StaffIDs>", staffID]];
    
    if (daysOfWeek)
    {
        [soap appendString:@"<DaysOfWeek>"];
        for (NSString *day in daysOfWeek)
        {
            [soap appendString:[NSString stringWithFormat:@"<DayOfWeek>%@</DayOfWeek>", day]];
        }
        [soap appendString:@"</DaysOfWeek>"];
    }
    
    [soap appendString:@"</Request></AddOrUpdateAvailabilities></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_APPT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"AddOrUpdateAvailabilities"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

@end
