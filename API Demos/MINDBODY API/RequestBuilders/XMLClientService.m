//
//  BuilderClientService.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/30/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "XMLClientService.h"

@implementation XMLClientService

+ (NSURLRequest*)SOAPGetClients:(NSArray*)IDs :(NSString*)searchText :(DataDetail)detail :(int)limit
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetClients>"
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
    
    if (IDs != nil)
    {
        [soap appendString:@"<ClientIDs>"];
        for (NSNumber *ID in IDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<string>%@</string>", ID]];
        }
        [soap appendString:@"</ClientIDs>"];
    }
    
    // Search text
    [soap appendString:[NSString stringWithFormat:@"<SearchText>%@</SearchText>", searchText == nil ? @"" : searchText]];
    
    if (detail == DataDetailBasic)
    {
        [soap appendString:@"<XMLDetail>Basic</XMLDetail>"];
    }
    else if (detail == DataDetailBare)
    {
        [soap appendString:@"<XMLDetail>Bare</XMLDetail>"];
    }
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    
    
    if (limit > 0)
    {
        [soap appendString:[NSString stringWithFormat:@"<PageSize>%d</PageSize>", limit]];
    }
    
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
    [soap appendString:@"</Request></GetClients></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetClients"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPAddClient:(Client*)client
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<AddOrUpdateClients xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
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
    
    UserCredentials *user = [UserCredentials sharedInstance];
    if ([user Username] && [user Password] && [user SiteID])
    {
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"<PageSize>0</PageSize>"];
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
    [soap appendString:@"<UpdateAction>AddNew</UpdateAction>"];
    //[soap appendString:@"<Test>true</Test>"];
    
    [soap appendString:@"<Clients>"];
    [soap appendString:@"<Client>"];
    if (client.FirstName) [soap appendString: [NSString stringWithFormat:@"<FirstName>%@</FirstName>", client.FirstName]];
    if (client.LastName) [soap appendString: [NSString stringWithFormat:@"<LastName>%@</LastName>", client.LastName]];
    if (client.MiddleName) [soap appendString: [NSString stringWithFormat:@"<MiddleName>%@</MiddleName>", client.MiddleName]];
    if (client.Email) [soap appendString: [NSString stringWithFormat:@"<Email>%@</Email>", client.Email]];
    if (client.MobilePhone) [soap appendString: [NSString stringWithFormat:@"<MobilePhone>%@</MobilePhone>", client.MobilePhone]];
    if (client.HomePhone) [soap appendString: [NSString stringWithFormat:@"<HomePhone>%@</HomePhone>", client.HomePhone]];
    if (client.WorkPhone) [soap appendString: [NSString stringWithFormat:@"<WorkPhone>%@</WorkPhone>", client.WorkPhone]];
    if (client.AddressLine1) [soap appendString: [NSString stringWithFormat:@"<AddressLine1>%@</AddressLine1>", client.AddressLine1]];
    if (client.AddressLine2) [soap appendString: [NSString stringWithFormat:@"<AddressLine2>%@</AddressLine2>", client.AddressLine2]];
    if (client.City) [soap appendString: [NSString stringWithFormat:@"<City>%@</City>", client.City]];
    if (client.State) [soap appendString: [NSString stringWithFormat:@"<State>%@</State>", client.State]];
    if (client.Country) [soap appendString: [NSString stringWithFormat:@"<Country>%@</Country>", client.Country]];
    if (client.PostalCode) [soap appendString: [NSString stringWithFormat:@"<PostalCode>%@</PostalCode>", client.PostalCode]];
    if (client.ForeignZip) [soap appendString: [NSString stringWithFormat:@"<ForeignZip>%@</ForeignZip>", client.ForeignZip]];
    if (client.Username) [soap appendString: [NSString stringWithFormat:@"<Username>%@</Username>", client.Username]];
    if (client.Password) [soap appendString: [NSString stringWithFormat:@"<Password>%@</Password>", client.Password]];
    if (client.Notes) [soap appendString: [NSString stringWithFormat:@"<Notes>%@</Notes>", client.Notes]];
    if (client.Gender) [soap appendString: [NSString stringWithFormat:@"<Gender>%@</Gender>", client.Gender]];
    if (client.EmergencyContactInfoName) [soap appendString: [NSString stringWithFormat:@"<EmergencyContactInfoName>%@</EmergencyContactInfoName>", client.EmergencyContactInfoName]];
    if (client.EmergencyContactInfoRelationship) [soap appendString: [NSString stringWithFormat:@"<EmergencyContactInfoRelationship>%@</EmergencyContactInfoRelationship>", client.EmergencyContactInfoRelationship]];
    if (client.EmergencyContactInfoPhone) [soap appendString: [NSString stringWithFormat:@"<EmergencyContactInfoPhone>%@</EmergencyContactInfoPhone>", client.EmergencyContactInfoPhone]];
    if (client.EmergencyContactInfoEmail) [soap appendString: [NSString stringWithFormat:@"<EmergencyContactInfoEmail>%@</EmergencyContactInfoEmail>", client.EmergencyContactInfoEmail]];
    if (client.ReferredBy) [soap appendString: [NSString stringWithFormat:@"<ReferredBy>%@</ReferredBy>", client.ReferredBy]];
    if (client.EmailOptInSpecified) [soap appendString: [NSString stringWithFormat:@"<EmailOptIn>%@</EmailOptIn>", client.EmailOptIn ? @"true" : @"false"]];
    if (client.LiabilityReleaseSpecified) [soap appendString: [NSString stringWithFormat:@"<LiabilityRelease>%@</LiabilityRelease>", client.LiabilityRelease ? @"true" : @"false"]];
    if (client.InactiveSpecified) [soap appendString: [NSString stringWithFormat:@"<Inactive>%@</Inactive>", client.Inactive ? @"true" : @"false"]];
    if (client.IsCompanySpecified) [soap appendString: [NSString stringWithFormat:@"<IsCompany>%@</IsCompany>", client.IsCompany ? @"true" : @"false"]];
    if (client.IsProspectSpecified) [soap appendString: [NSString stringWithFormat:@"<IsProspect>%@</IsProspect>", client.IsProspect ? @"true" : @"false"]];
    if (client.BirthDate) [soap appendString: [NSString stringWithFormat:@"<BirthDate>%@</BirthDate>", [Utils convertDateToISO:client.BirthDate]]];
    [soap appendString:@"</Client>"];
    [soap appendString:@"</Clients>"];
    [soap appendString:@"</Request></AddOrUpdateClients></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"AddOrUpdateClients"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPUpdateClient:(Client*)client clientID:(NSString*)ID
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<AddOrUpdateClients xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
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
    
    UserCredentials *user = [UserCredentials sharedInstance];
    if ([user Username] && [user Password] && [user SiteID])
    {
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"<PageSize>0</PageSize>"];
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
    [soap appendString:@"<UpdateAction>Fail</UpdateAction>"];
    [soap appendString:@"<Test>false</Test>"];
    
    [soap appendString:@"<Clients>"];
    [soap appendString:@"<Client>"];
    // Specify client
    [soap appendString: [NSString stringWithFormat:@"<ID>%@</ID>", ID]];
    
    if (client.FirstName) [soap appendString: [NSString stringWithFormat:@"<FirstName>%@</FirstName>", client.FirstName]];
    if (client.LastName) [soap appendString: [NSString stringWithFormat:@"<LastName>%@</LastName>", client.LastName]];
    if (client.MiddleName) [soap appendString: [NSString stringWithFormat:@"<MiddleName>%@</MiddleName>", client.MiddleName]];
    if (client.Email) [soap appendString: [NSString stringWithFormat:@"<Email>%@</Email>", client.Email]];
    if (client.MobilePhone) [soap appendString: [NSString stringWithFormat:@"<MobilePhone>%@</MobilePhone>", client.MobilePhone]];
    if (client.HomePhone) [soap appendString: [NSString stringWithFormat:@"<HomePhone>%@</HomePhone>", client.HomePhone]];
    if (client.WorkPhone) [soap appendString: [NSString stringWithFormat:@"<WorkPhone>%@</WorkPhone>", client.WorkPhone]];
    if (client.AddressLine1) [soap appendString: [NSString stringWithFormat:@"<AddressLine1>%@</AddressLine1>", client.AddressLine1]];
    if (client.AddressLine2) [soap appendString: [NSString stringWithFormat:@"<AddressLine2>%@</AddressLine2>", client.AddressLine2]];
    if (client.City) [soap appendString: [NSString stringWithFormat:@"<City>%@</City>", client.City]];
    if (client.State) [soap appendString: [NSString stringWithFormat:@"<State>%@</State>", client.State]];
    if (client.Country) [soap appendString: [NSString stringWithFormat:@"<Country>%@</Country>", client.Country]];
    if (client.PostalCode) [soap appendString: [NSString stringWithFormat:@"<PostalCode>%@</PostalCode>", client.PostalCode]];
    if (client.ForeignZip) [soap appendString: [NSString stringWithFormat:@"<ForeignZip>%@</ForeignZip>", client.ForeignZip]];
    if (client.Username) [soap appendString: [NSString stringWithFormat:@"<Username>%@</Username>", client.Username]];
    if (client.Password) [soap appendString: [NSString stringWithFormat:@"<Password>%@</Password>", client.Password]];
    if (client.Notes) [soap appendString: [NSString stringWithFormat:@"<Notes>%@</Notes>", client.Notes]];
    if (client.Gender) [soap appendString: [NSString stringWithFormat:@"<Gender>%@</Gender>", client.Gender]];
    if (client.EmergencyContactInfoName) [soap appendString: [NSString stringWithFormat:@"<EmergencyContactInfoName>%@</EmergencyContactInfoName>", client.EmergencyContactInfoName]];
    if (client.EmergencyContactInfoRelationship) [soap appendString: [NSString stringWithFormat:@"<EmergencyContactInfoRelationship>%@</EmergencyContactInfoRelationship>", client.EmergencyContactInfoRelationship]];
    if (client.EmergencyContactInfoPhone) [soap appendString: [NSString stringWithFormat:@"<EmergencyContactInfoPhone>%@</EmergencyContactInfoPhone>", client.EmergencyContactInfoPhone]];
    if (client.EmergencyContactInfoEmail) [soap appendString: [NSString stringWithFormat:@"<EmergencyContactInfoEmail>%@</EmergencyContactInfoEmail>", client.EmergencyContactInfoEmail]];
    if (client.ReferredBy) [soap appendString: [NSString stringWithFormat:@"<ReferredBy>%@</ReferredBy>", client.ReferredBy]];
    if (client.EmailOptInSpecified) [soap appendString: [NSString stringWithFormat:@"<EmailOptIn>%@</EmailOptIn>", client.EmailOptIn ? @"true" : @"false"]];
    if (client.LiabilityReleaseSpecified) [soap appendString: [NSString stringWithFormat:@"<LiabilityRelease>%@</LiabilityRelease>", client.LiabilityRelease ? @"true" : @"false"]];
    if (client.InactiveSpecified) [soap appendString: [NSString stringWithFormat:@"<Inactive>%@</Inactive>", client.Inactive ? @"true" : @"false"]];
    if (client.IsCompanySpecified) [soap appendString: [NSString stringWithFormat:@"<IsCompany>%@</IsCompany>", client.IsCompany ? @"true" : @"false"]];
    if (client.IsProspectSpecified) [soap appendString: [NSString stringWithFormat:@"<IsProspect>%@</IsProspect>", client.IsProspect ? @"true" : @"false"]];
    if (client.BirthDate) [soap appendString: [NSString stringWithFormat:@"<BirthDate>%@</BirthDate>", [Utils convertDateToISO:client.BirthDate]]];
    
    [soap appendString:@"</Client>"];
    [soap appendString:@"</Clients>"];
    [soap appendString:@"</Request></AddOrUpdateClients></soapenv:Body></soapenv:Envelope>"];
    
    // // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"AddOrUpdateClients"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPUpdateClientCreditCard:(ClientCreditCard*)card clientID:(NSString*)ID
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<AddOrUpdateClients xmlns=\"http://clients.mindbodyonline.com/api/0_5\">"
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
    
    UserCredentials *user = [UserCredentials sharedInstance];
    if ([user Username] && [user Password] && [user SiteID])
    {
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    [soap appendString:@"<XMLDetail>Bare</XMLDetail>"];
    [soap appendString:@"<PageSize>0</PageSize>"];
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
    [soap appendString:@"<UpdateAction>Fail</UpdateAction>"];
    [soap appendString:@"<Test>false</Test>"];
    
    [soap appendString:@"<Clients>"];
    [soap appendString:@"<Client>"];
    // Specify client
    [soap appendString: [NSString stringWithFormat:@"<ID>%@</ID>", ID]];
    
    [soap appendString:@"<ClientCreditCard>"];
    if (card.CardHolder) [soap appendString: [NSString stringWithFormat:@"<CardHolder>%@</CardHolder>", card.CardHolder]];
    if (card.CardNumber) [soap appendString: [NSString stringWithFormat:@"<CardNumber>%@</CardNumber>", card.CardNumber]];
    if (card.CardType) [soap appendString: [NSString stringWithFormat:@"<CardType>%@</CardType>", card.CardType]];
    if (card.Address) [soap appendString: [NSString stringWithFormat:@"<Address>%@</Address>", card.Address]];
    if (card.City) [soap appendString: [NSString stringWithFormat:@"<City>%@</City>", card.City]];
    if (card.PostalCode) [soap appendString: [NSString stringWithFormat:@"<PostalCode>%@</PostalCode>", card.PostalCode]];
    if (card.State) [soap appendString: [NSString stringWithFormat:@"<State>%@</State>", card.State]];
    if (card.ExpMonth) [soap appendString: [NSString stringWithFormat:@"<ExpMonth>%@</ExpMonth>", card.ExpMonth]];
    if (card.ExpYear) [soap appendString: [NSString stringWithFormat:@"<ExpYear>%@</ExpYear>", card.ExpYear]];
    if (card.LastFour) [soap appendString: [NSString stringWithFormat:@"<LastFour>%@</LastFour>", card.LastFour]];
    [soap appendString:@"</ClientCreditCard>"];
    [soap appendString:@"</Client>"];
    [soap appendString:@"</Clients>"];
    [soap appendString:@"</Request></AddOrUpdateClients></soapenv:Body></soapenv:Envelope>"];
    
    // // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"AddOrUpdateClients"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetClientCreditCard:(NSString*)clientID
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetClients>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    UserCredentials *user = [UserCredentials sharedInstance];
    if ([user Username] && [user Password] && [user SiteID])
    {
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    [soap appendString:@"<ClientIDs>"];
    [soap appendString:[NSString stringWithFormat:@"<string>%@</string>", clientID]];
    [soap appendString:@"</ClientIDs>"];
    
    [soap appendString:@"<Fields><string>Clients.ClientCreditCard</string></Fields>"];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"<PageSize>0</PageSize>"];
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
    [soap appendString:@"</Request></GetClients></soapenv:Body></soapenv:Envelope>"];
    
    // // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetClients"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetClientVisits:(NSString*)clientID startDate:(NSDate*)date
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    //UserCredentials *user = [UserCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetClientVisits>"
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
    /*[soap appendString:@"<UserCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
    [soap appendString:@"<SiteIDs>"];
    for (NSNumber *siteID in user.SiteIDs)
    {
        [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", siteID]];
    }
    [soap appendString:@"</SiteIDs>"];
    [soap appendString:@"</UserCredentials>"];*/
    
    [soap appendString:@"<ClientID>"];
    [soap appendString:clientID];
    [soap appendString:@"</ClientID>"];
    if (date) [soap appendString:[NSString stringWithFormat:@"<StartDate>%@</StartDate>", [Utils dateToString:date format:ISO_DATE_FORMAT]]];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"<PageSize>0</PageSize>"];
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
    [soap appendString:@"</Request></GetClientVisits></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetClientVisits"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetClientSchedule:(NSString*)clientID endDate:(NSDate*)date
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    //UserCredentials *user = [UserCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetClientSchedule>"
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
    /*[soap appendString:@"<UserCredentials>"];
     [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
     [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
     [soap appendString:@"<SiteIDs>"];
     for (NSNumber *siteID in user.SiteIDs)
     {
     [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", siteID]];
     }
     [soap appendString:@"</SiteIDs>"];
     [soap appendString:@"</UserCredentials>"];*/
    
    [soap appendString:@"<ClientID>"];
    [soap appendString:clientID];
    [soap appendString:@"</ClientID>"];
    if (date) [soap appendString:[NSString stringWithFormat:@"<EndDate>%@</EndDate>", [Utils convertDateToISO:date]]];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"<PageSize>0</PageSize>"];
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
    [soap appendString:@"</Request></GetClientSchedule></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetClientSchedule"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetClientAccountBalances:(NSString*)clientID
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetClientAccountBalances>"
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
    /*[soap appendString:@"<UserCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
    [soap appendString:@"<SiteIDs>"];
    for (NSNumber *siteID in user.SiteIDs)
    {
        [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", siteID]];
    }
    [soap appendString:@"</SiteIDs>"];
    [soap appendString:@"</UserCredentials>"];*/
    
    [soap appendString:@"<ClientIDs>"];
    [soap appendString:[NSString stringWithFormat:@"<string>%@</string>", clientID]];
    [soap appendString:@"</ClientIDs>"];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"<PageSize>0</PageSize>"];
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
    [soap appendString:@"</Request></GetClientAccountBalances></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetClientAccountBalances"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetRequiredClientFields
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetRequiredClientFields>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetRequiredClientFields></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetRequiredClientFields"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}


+ (NSURLRequest*)SOAPGetClientIndexes
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetClientIndexes>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetClientIndexes></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetClientIndexes"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}


+ (NSURLRequest*)SOAPGetClientServices:(NSString*)clientID serviceCategoryIDs:(NSMutableArray*)serviceCategoryIDs classID:(NSString*)classID sessionTypeIDs:(NSMutableArray*)sessionTypeIDs startDate:(NSDate*)startDate endDate:(NSDate*)endDate
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetClientServices>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    
    UserCredentials *user = [UserCredentials sharedInstance];
    if ([user Username] && [user Password] && [user SiteID])
    {
        [soap appendString:@"<UserCredentials>"];
        [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
        [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
        [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", user.SiteID]];
        [soap appendString:@"</UserCredentials>"];
    }
    
    
    [soap appendString:@"<ClientID>"];
    [soap appendString:clientID];
    [soap appendString:@"</ClientID>"];
    
    // Use service category  IDs
    if (serviceCategoryIDs)
    {
        [soap appendString:@"<ProgramIDs>"];
        for (NSString *ID in serviceCategoryIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</ProgramIDs>"];
    }
    
    // Use session type IDs
    if (sessionTypeIDs)
    {
        [soap appendString:@"<SessionTypeIDs>"];
        for (NSString *ID in sessionTypeIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</SessionTypeIDs>"];
    }
    
    // Use class ID
    if (classID)
    {
        [soap appendString:@"<ClassID>"];
        [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", classID]];
        [soap appendString:@"</ClassID>"];
    }
    
    // Specify window
    if (startDate) [soap appendString:[NSString stringWithFormat:@"<StartDate>%@</StartDate>", [Utils dateToString:startDate format:ISO_DATE_FORMAT]]];
    if (endDate) [soap appendString:[NSString stringWithFormat:@"<EndDate>%@</EndDate>", [Utils dateToString:endDate format:ISO_DATE_FORMAT]]];
    
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"<ShowActiveOnly>true</ShowActiveOnly>"];
    
    [soap appendString:@"</Request></GetClientServices></soapenv:Body></soapenv:Envelope>"];
    
    // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetClientServices"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPValidateLogin:(NSString*)username password:(NSString*)password
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<ValidateLogin>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", username]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", password]];
    [soap appendString:@"</Request></ValidateLogin></soapenv:Body></soapenv:Envelope>"];
    
    // // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"ValidateLogin"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetClientReferralTypes
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetClientReferralTypes>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    [soap appendString:@"</Request></GetClientReferralTypes></soapenv:Body></soapenv:Envelope>"];
    
    // // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetClientReferralTypes"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetClientPurchases:(NSString*)clientID startDate:(NSDate*)startDate endDate:(NSDate*)endDate
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    //UserCredentials *user = [UserCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetClientPurchases>"
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
    /*[soap appendString:@"<UserCredentials>"];
     [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
     [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
     [soap appendString:@"<SiteIDs>"];
     for (NSNumber *siteID in user.SiteIDs)
     {
     [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", siteID]];
     }
     [soap appendString:@"</SiteIDs>"];
     [soap appendString:@"</UserCredentials>"];*/
    
    [soap appendString:@"<ClientID>"];
    [soap appendString:clientID];
    [soap appendString:@"</ClientID>"];
    if (startDate) [soap appendString:[NSString stringWithFormat:@"<StartDate>%@</StartDate>", [Utils dateToString:startDate format:ISO_DATE_TIME_FORMAT]]];
    if (endDate) [soap appendString:[NSString stringWithFormat:@"<EndDate>%@</EndDate>", [Utils dateToString:endDate format:ISO_DATE_TIME_FORMAT]]];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"<PageSize>0</PageSize>"];
    [soap appendString:@"<CurrentPageIndex>0</CurrentPageIndex>"];
    [soap appendString:@"</Request></GetClientPurchases></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetClientPurchases"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetClientMemberships:(NSString*)clientID byLocationIDOrNil:(NSString*)locationID
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    //UserCredentials *user = [UserCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetActiveClientMemberships>"
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
    /*[soap appendString:@"<UserCredentials>"];
     [soap appendString:[NSString stringWithFormat:@"<Username>%@</Username>", user.Username]];
     [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", user.Password]];
     [soap appendString:@"<SiteIDs>"];
     for (NSNumber *siteID in user.SiteIDs)
     {
     [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", siteID]];
     }
     [soap appendString:@"</SiteIDs>"];
     [soap appendString:@"</UserCredentials>"];*/
    
    [soap appendString:[NSString stringWithFormat:@"<ClientID>%@</ClientID>", clientID]];
    [soap appendString:@"<XMLDetail>Full</XMLDetail>"];
    [soap appendString:@"</Request></GetActiveClientMemberships></soapenv:Body></soapenv:Envelope>"];
    
     // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_CLIENT];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetActiveClientMemberships"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

@end
