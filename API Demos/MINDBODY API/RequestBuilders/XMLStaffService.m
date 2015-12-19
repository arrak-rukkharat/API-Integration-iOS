//
//  Created by Arrak Rukkharat on 7/23/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "XMLStaffService.h"

@implementation XMLStaffService

#pragma mark Staff service

+ (NSURLRequest*) SOAPGetStaff:(NSArray*)staffIDs
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetStaff xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:@"<SourceName>"];
    [soap appendString:src.SourceName];
    [soap appendString:@"</SourceName>"];
    [soap appendString:@"<Password>"];
    [soap appendString:src.Password];
    [soap appendString:@"</Password>"];
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
    
    // staff ids
    if (staffIDs)
    {
        [soap appendString:@"<StaffIDs>"];
        for (NSString *staffID in staffIDs)
        {
            [soap appendString:@"<long>"];
            [soap appendString:staffID];
            [soap appendString:@"</long>"];
        }
        [soap appendString:@"</StaffIDs>"];
    }
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"<PageSize>0</PageSize>"];
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
    /*[soap appendString:@"<Filters><StaffFilter>StaffViewable</StaffFilter></Filters>"];*/
    [soap appendString:@"</Request></GetStaff></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_STAFF];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetStaff"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*) SOAPValidateStaffLoginWithUsername:(NSString*)username password:(NSString*)password
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<ValidateStaffLogin xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:@"<SourceName>"];
    [soap appendString:src.SourceName];
    [soap appendString:@"</SourceName>"];
    [soap appendString:@"<Password>"];
    [soap appendString:src.Password];
    [soap appendString:@"</Password>"];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    
    [soap appendString:@"<Username>"];
    [soap appendString:username];
    [soap appendString:@"</Username>"];
    [soap appendString:@"<Password>"];
    [soap appendString:password];
    [soap appendString:@"</Password>"];
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"<PageSize>0</PageSize>"];
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
    [soap appendString:@"</Request></ValidateStaffLogin></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_STAFF];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"ValidateStaffLogin"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPAddStaff:(Staff*)staff
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<AddOrUpdateStaff xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:@"<SourceName>"];
    [soap appendString:src.SourceName];
    [soap appendString:@"</SourceName>"];
    [soap appendString:@"<Password>"];
    [soap appendString:src.Password];
    [soap appendString:@"</Password>"];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"<PageSize>0</PageSize>"];
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
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
    [soap appendString:@"<UpdateAction>AddNew</UpdateAction>"];
    //[soap appendString:@"<Test>true</Test>"];
    
    [soap appendString:@"<Staff>"];
    [soap appendString:@"<Staff>"];
    [soap appendString: [NSString stringWithFormat:@"<FirstName>%@</FirstName>", staff.FirstName]];
    [soap appendString: [NSString stringWithFormat:@"<LastName>%@</LastName>", staff.LastName]];
    [soap appendString: [NSString stringWithFormat:@"<Email>%@</Email>", staff.Email]];
    [soap appendString: [NSString stringWithFormat:@"<MobilePhone>%@</MobilePhone>", staff.MobilePhone]];
    [soap appendString: [NSString stringWithFormat:@"<HomePhone>%@</HomePhone>", staff.HomePhone]];
    [soap appendString: [NSString stringWithFormat:@"<WorkPhone>%@</WorkPhone>", staff.WorkPhone]];
    [soap appendString: [NSString stringWithFormat:@"<Address>%@</Address>", staff.Address]];
    [soap appendString: [NSString stringWithFormat:@"<Address2>%@</Address2>", staff.Address2]];
    [soap appendString: [NSString stringWithFormat:@"<City>%@</City>", staff.City]];
    [soap appendString: [NSString stringWithFormat:@"<State>%@</State>", staff.State]];
    [soap appendString: [NSString stringWithFormat:@"<Country>%@</Country>", staff.Country]];
    [soap appendString: [NSString stringWithFormat:@"<PostalCode>%@</PostalCode>", staff.PostalCode]];
    [soap appendString: [NSString stringWithFormat:@"<ForeignZip>%@</ForeignZip>", staff.ForeignZip]];
    [soap appendString: [NSString stringWithFormat:@"<Bio>%@</Bio>", staff.Bio]];
    [soap appendString: [NSString stringWithFormat:@"<isMale>%@</isMale>", staff.isMale ? @"true" : @"false"]];
    [soap appendString:@"</Staff>"];
    [soap appendString:@"</Staff>"];
    [soap appendString:@"</Request></AddOrUpdateStaff></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_STAFF];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"AddOrUpdateStaff"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPUpdateStaff:(Staff*)staff by:(NSString*)ID
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<AddOrUpdateStaff xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:@"<SourceName>"];
    [soap appendString:src.SourceName];
    [soap appendString:@"</SourceName>"];
    [soap appendString:@"<Password>"];
    [soap appendString:src.Password];
    [soap appendString:@"</Password>"];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"<PageSize>0</PageSize>"];
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
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
    [soap appendString:@"<UpdateAction>Fail</UpdateAction>"];
    [soap appendString:@"<Test>false</Test>"];
    
    [soap appendString:@"<Staff>"];
    [soap appendString:@"<Staff>"];
    [soap appendString: [NSString stringWithFormat:@"<FirstName>%@</FirstName>", staff.FirstName]];
    [soap appendString: [NSString stringWithFormat:@"<LastName>%@</LastName>", staff.LastName]];
    [soap appendString: [NSString stringWithFormat:@"<Email>%@</Email>", staff.Email]];
    [soap appendString: [NSString stringWithFormat:@"<MobilePhone>%@</MobilePhone>", staff.MobilePhone]];
    [soap appendString: [NSString stringWithFormat:@"<HomePhone>%@</HomePhone>", staff.HomePhone]];
    [soap appendString: [NSString stringWithFormat:@"<WorkPhone>%@</WorkPhone>", staff.WorkPhone]];
    [soap appendString: [NSString stringWithFormat:@"<Address>%@</Address>", staff.Address]];
    [soap appendString: [NSString stringWithFormat:@"<Address2>%@</Address2>", staff.Address2]];
    [soap appendString: [NSString stringWithFormat:@"<City>%@</City>", staff.City]];
    [soap appendString: [NSString stringWithFormat:@"<State>%@</State>", staff.State]];
    [soap appendString: [NSString stringWithFormat:@"<Country>%@</Country>", staff.Country]];
    [soap appendString: [NSString stringWithFormat:@"<PostalCode>%@</PostalCode>", staff.PostalCode]];
    [soap appendString: [NSString stringWithFormat:@"<ForeignZip>%@</ForeignZip>", staff.ForeignZip]];
    [soap appendString: [NSString stringWithFormat:@"<Bio>%@</Bio>", staff.Bio]];
    [soap appendString: [NSString stringWithFormat:@"<ID>%@</ID>", ID]];
    [soap appendString: [NSString stringWithFormat:@"<isMale>%@</isMale>", staff.isMale ? @"true" : @"false"]];
    [soap appendString:@"</Staff>"];
    [soap appendString:@"</Staff>"];
    [soap appendString:@"</Request></AddOrUpdateStaff></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_STAFF];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"AddOrUpdateStaff"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetStaffPermissions:(NSString*)staffID
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetStaffPermissions xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:@"<SourceName>"];
    [soap appendString:src.SourceName];
    [soap appendString:@"</SourceName>"];
    [soap appendString:@"<Password>"];
    [soap appendString:src.Password];
    [soap appendString:@"</Password>"];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"<PageSize>0</PageSize>"];
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
    
    [soap appendString:@"<StaffID>"];
    [soap appendString:staffID];
    [soap appendString:@"</StaffID>"];
    [soap appendString:@"</Request></GetStaffPermissions></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_STAFF];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetStaffPermissions"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

@end
