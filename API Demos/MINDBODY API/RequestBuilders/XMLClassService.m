//
//  XMLClassService.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 9/4/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "XMLClassService.h"

@implementation XMLClassService


+ (NSURLRequest*)SOAPAddClientToClass:(NSString*)classID clientID:(NSString*)clientID waitlist:(BOOL)waitlist sendEmail:(BOOL)sendEmail requirePayment:(BOOL)requirePayment serviceID:(NSString*)serviceID
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<AddClientsToClasses>"
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
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }

    if (classID) [soap appendString:[NSString stringWithFormat:@"<ClassIDs><int>%@</int></ClassIDs>", classID]];

    if (clientID) [soap appendString:[NSString stringWithFormat:@"<ClientIDs><string>%@</string></ClientIDs>", clientID]];
    
    if (serviceID) [soap appendString:[NSString stringWithFormat:@"<ClientServiceID>%@</ClientServiceID>", serviceID]];
    
    [soap appendString:[NSString stringWithFormat:@"<RequirePayment>%@</RequirePayment>", (requirePayment ? @"true" : @"false")]];
    
    [soap appendString:[NSString stringWithFormat:@"<SendEmail>%@</SendEmail>", (sendEmail ? @"true" : @"false")]];
    
    [soap appendString:[NSString stringWithFormat:@"<Waitlist>%@</Waitlist>", (waitlist ? @"true" : @"false")]];
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></AddClientsToClasses></soapenv:Body></soapenv:Envelope>"];
    
     //NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLASS];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"AddClientsToClasses"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetClasses:(NSArray*)classIDs staffIDs:(NSArray*)staffIDs startDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime clientID:(NSString*)clientID serviceCategoryIDs:(NSArray*)programIDs sessionTypeIDs:(NSArray*)sessionTypeIDs locationIDs:(NSArray*)locationIDs schedulingWindow:(BOOL)schedulingWindow
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetClasses>"
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
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    // IDs
    
    if (classIDs != nil)
    {
        [soap appendString:@"<ClassIDs>"];
        for (NSString *ID in classIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</ClassIDs>"];
    }
    if (staffIDs != nil)
    {
        [soap appendString:@"<StaffIDs>"];
        for (NSString *ID in staffIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<long>%@</long>", ID]];
        }
        [soap appendString:@"</StaffIDs>"];
    }
    if (programIDs != nil)
    {
        [soap appendString:@"<ProgramIDs>"];
        for (NSString *ID in programIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</ProgramIDs>"];
    }
    if (sessionTypeIDs != nil)
    {
        [soap appendString:@"<SessionTypeIDs>"];
        for (NSString *ID in sessionTypeIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</SessionTypeIDs>"];
    }
    if (locationIDs != nil)
    {
        [soap appendString:@"<LocationIDs>"];
        for (NSString *ID in locationIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</LocationIDs>"];
    }
    
    if (startDateTime) [soap appendString:[NSString stringWithFormat:@"<StartDateTime>%@</StartDateTime>", [Utils convertDateToISO:startDateTime]]];
    if (endDateTime) [soap appendString:[NSString stringWithFormat:@"<EndDateTime>%@</EndDateTime>", [Utils convertDateToISO:endDateTime]]];
    if (clientID) [soap appendString:[NSString stringWithFormat:@"<ClientID>%@</ClientID>", clientID]];
    
    [soap appendString:[NSString stringWithFormat:@"<SchedulingWindow>%@</SchedulingWindow>", (schedulingWindow ? @"true" : @"false")]];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetClasses></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLASS];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetClasses"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetClassSchedule:(NSArray*)classScheduleIDs staffIDs:(NSArray*)staffIDs startDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime serviceCategoryIDs:(NSArray*)programIDs sessionTypeIDs:(NSArray*)sessionTypeIDs locationIDs:(NSArray*)locationIDs
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetClassSchedules>"
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
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    // IDs
    
    if (classScheduleIDs != nil)
    {
        [soap appendString:@"<ClassScheduleIDs>"];
        for (NSString *ID in classScheduleIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</ClassScheduleIDs>"];
    }
    if (staffIDs != nil)
    {
        [soap appendString:@"<StaffIDs>"];
        for (NSString *ID in staffIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<long>%@</long>", ID]];
        }
        [soap appendString:@"</StaffIDs>"];
    }
    if (programIDs != nil)
    {
        [soap appendString:@"<ProgramIDs>"];
        for (NSString *ID in programIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</ProgramIDs>"];
    }
    if (sessionTypeIDs != nil)
    {
        [soap appendString:@"<SessionTypeIDs>"];
        for (NSString *ID in sessionTypeIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</SessionTypeIDs>"];
    }
    if (locationIDs != nil)
    {
        [soap appendString:@"<LocationIDs>"];
        for (NSString *ID in locationIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</LocationIDs>"];
    }
    
    if (startDateTime) [soap appendString:[NSString stringWithFormat:@"<StartDateTime>%@</StartDateTime>", [Utils convertDateToISO:startDateTime]]];
    if (endDateTime) [soap appendString:[NSString stringWithFormat:@"<EndDateTime>%@</EndDateTime>", [Utils convertDateToISO:endDateTime]]];
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetClassSchedules></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLASS];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetClassSchedules"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetClassVisits:(NSString*)classID
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetClassVisits>"
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
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    if (classID) [soap appendString:[NSString stringWithFormat:@"<ClassID>%@</ClassID>", classID]];
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetClassVisits></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLASS];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetClassVisits"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetCourses:(NSArray*)courseIDs staffIDs:(NSArray*)staffIDs startDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime serviceCategoryIDs:(NSArray*)programIDs semesterIDs:(NSArray*)semesterIDs locationIDs:(NSArray*)locationIDs
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetCourses>"
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
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    // IDs
    
    if (courseIDs != nil)
    {
        [soap appendString:@"<CourseIDs>"];
        for (NSString *ID in courseIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</CourseIDs>"];
    }
    if (staffIDs != nil)
    {
        [soap appendString:@"<StaffIDs>"];
        for (NSString *ID in staffIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<long>%@</long>", ID]];
        }
        [soap appendString:@"</StaffIDs>"];
    }
    if (programIDs != nil)
    {
        [soap appendString:@"<ProgramIDs>"];
        for (NSString *ID in programIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</ProgramIDs>"];
    }
    if (semesterIDs != nil)
    {
        [soap appendString:@"<SemesterIDs>"];
        for (NSString *ID in semesterIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</SemesterIDs>"];
    }
    if (locationIDs != nil)
    {
        [soap appendString:@"<LocationIDs>"];
        for (NSString *ID in locationIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</LocationIDs>"];
    }
    
    if (startDateTime) [soap appendString:[NSString stringWithFormat:@"<StartDate>%@</StartDate>", [Utils convertDateToISO:startDateTime]]];
    if (endDateTime) [soap appendString:[NSString stringWithFormat:@"<EndDate>%@</EndDate>", [Utils convertDateToISO:endDateTime]]];
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetCourses></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLASS];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetCourses"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetEnrollments:(NSArray*)courseIDs staffIDs:(NSArray*)staffIDs startDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime serviceCategoryIDs:(NSArray*)programIDs semesterIDs:(NSArray*)semesterIDs locationIDs:(NSArray*)locationIDs sessionTypeIDs:(NSArray*)sessionTypeIDs classScheduleIDs:(NSArray*)classScheduleIDs
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetEnrollments>"
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
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    // IDs
    
    if (courseIDs != nil)
    {
        [soap appendString:@"<CourseIDs>"];
        for (NSString *ID in courseIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</CourseIDs>"];
    }
    if (staffIDs != nil)
    {
        [soap appendString:@"<StaffIDs>"];
        for (NSString *ID in staffIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<long>%@</long>", ID]];
        }
        [soap appendString:@"</StaffIDs>"];
    }
    if (programIDs != nil)
    {
        [soap appendString:@"<ProgramIDs>"];
        for (NSString *ID in programIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</ProgramIDs>"];
    }
    if (semesterIDs != nil)
    {
        [soap appendString:@"<SemesterIDs>"];
        for (NSString *ID in semesterIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</SemesterIDs>"];
    }
    if (locationIDs != nil)
    {
        [soap appendString:@"<LocationIDs>"];
        for (NSString *ID in locationIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</LocationIDs>"];
    }
    if (sessionTypeIDs != nil)
    {
        [soap appendString:@"<SessionTypeIDs>"];
        for (NSString *ID in sessionTypeIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</SessionTypeIDs>"];
    }
    if (classScheduleIDs != nil)
    {
        [soap appendString:@"<ClassScheduleIDs>"];
        for (NSString *ID in classScheduleIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</ClassScheduleIDs>"];
    }
    
    if (startDateTime) [soap appendString:[NSString stringWithFormat:@"<StartDate>%@</StartDate>", [Utils convertDateToISO:startDateTime]]];
    if (endDateTime) [soap appendString:[NSString stringWithFormat:@"<EndDate>%@</EndDate>", [Utils convertDateToISO:endDateTime]]];
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetEnrollments></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLASS];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetEnrollments"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetSemesters:(NSArray*)semesterIDs
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetSemesters>"
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
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    if (semesterIDs != nil)
    {
        [soap appendString:@"<SemesterIDs>"];
        for (NSString *ID in semesterIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</SemesterIDs>"];
    }
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetSemesters></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLASS];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetSemesters"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}


+ (NSURLRequest*)SOAPCancelClass:(NSString*)classID sendClientEmail:(BOOL)sendClientEmail sendStaffEmail:(BOOL)sendStaffEmail
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<CancelSingleClass>"
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
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    if (classID) [soap appendString:[NSString stringWithFormat:@"<ClassID>%@</ClassID>", classID]];
    
    [soap appendString:[NSString stringWithFormat:@"<SendClientEmail>%@</SendClientEmail>", (sendClientEmail ? @"true" : @"false")]];
    [soap appendString:[NSString stringWithFormat:@"<SendStaffEmail>%@</SendStaffEmail>", (sendStaffEmail ? @"true" : @"false")]];
    
    [soap appendString:@"</Request></CancelSingleClass></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLASS];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"CancelSingleClass"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPDropClient:(NSString*)clientID fromClass:(NSString*)classID sendClientEmail:(BOOL)sendClientEmail lateCancel:(BOOL)lateCancel
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<RemoveClientsFromClasses>"
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
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    if (classID) [soap appendString:[NSString stringWithFormat:@"<ClassID>%@</ClassID>", classID]];
    
    [soap appendString:[NSString stringWithFormat:@"<SendEmail>%@</SendEmail>", (sendClientEmail ? @"true" : @"false")]];
    [soap appendString:[NSString stringWithFormat:@"<LateCancel>%@</LateCancel>", (lateCancel ? @"true" : @"false")]];
    
    [soap appendString:@"</Request></RemoveClientsFromClasses></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLASS];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"RemoveClientsFromClasses"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetWaitlistByClassID:(NSString*)classID byEntryID:(NSString*)entryID byClassScheduleID:(NSString*)classScheduleID byClientID:(NSString*)clientID hidePastEntries:(NSString*)hidePastEntries
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetWaitlistEntries>"
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
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    if (entryID) [soap appendString:[NSString stringWithFormat:@"<WaitlistEntryIDs><int>%@</int></WaitlistEntryIDs>", entryID]];
    if (classScheduleID) [soap appendString:[NSString stringWithFormat:@"<ClassScheduleIDs><int>%@</int></ClassScheduleIDs>", classScheduleID]];
    if (clientID) [soap appendString:[NSString stringWithFormat:@"<ClientIDs><string>%@</string></ClientIDs>", clientID]];
    if (classID) [soap appendString:[NSString stringWithFormat:@"<ClassIDs><int>%@</int></ClassIDs>", classID]];
    [soap appendString:[NSString stringWithFormat:@"<HidePastEntries>%@</HidePastEntries>", hidePastEntries ? @"true" : @"false"]];
    [soap appendString:@"</Request></GetWaitlistEntries></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLASS];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetWaitlistEntries"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPRemoveFromWaitlist:(NSString*)entryID
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<RemoveFromWaitlist>"
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
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    [soap appendString:[NSString stringWithFormat:@"<WaitlistEntryIDs><int>%@</int></WaitlistEntryIDs>", entryID]];
    
    [soap appendString:@"</Request></RemoveFromWaitlist></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLASS];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"RemoveFromWaitlist"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}


@end
