//
//  BuilderSiteService.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "XMLSiteService.h"

@implementation XMLSiteService

+ (NSURLRequest*)SOAPGetSites:(NSString*)SiteID filter:(NSString*)searchText
{
    
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetSites>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    if (searchText) [soap appendString:[NSString stringWithFormat:@"<SearchText>%@</SearchText>", searchText]];
    if (SiteID) [soap appendString:[NSString stringWithFormat:@"<RelatedSiteID>%@</RelatedSiteID>", SiteID]];
    [soap appendString:@"</Request></GetSites></soapenv:Body></soapenv:Envelope>"];
    
    // // NSLog(@"%@", soap);
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_SITE];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetSites"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetLocations
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetLocations>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    [soap appendString:@"</Request></GetLocations></soapenv:Body></soapenv:Envelope>"];
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_SITE];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetLocations"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

+ (NSURLRequest*)SOAPGetServiceCategories:(NSString*)type
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetPrograms>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials><OnlineOnly>false</OnlineOnly>"];
    [soap appendString:@"</Request></GetPrograms></soapenv:Body></soapenv:Envelope>"];
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_SITE];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetPrograms"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}


+ (NSURLRequest*)SOAPGetSessionTypes:(NSMutableArray*)progIDs
{
    SourceCredentials *src = [SourceCredentials sharedInstance];
    
    NSString *header = @"<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns=\"http://"
    "clients.mindbodyonline.com/api/0_5\">"
    "<soapenv:Header/>"
    "<soapenv:Body>"
    "<GetSessionTypes>"
    "<Request>";
    
    NSMutableString *soap = [NSMutableString new];
    [soap appendString:header];
    // Source
    [soap appendString:@"<SourceCredentials>"];
    [soap appendString:[NSString stringWithFormat:@"<SourceName>%@</SourceName>", src.SourceName]];
    [soap appendString:[NSString stringWithFormat:@"<Password>%@</Password>", src.Password]];
    [soap appendString:[NSString stringWithFormat:@"<SiteIDs><int>%@</int></SiteIDs>", src.SiteID]];
    [soap appendString:@"</SourceCredentials>"];
    
    
    if (progIDs)
    {
        [soap appendString:@"<ProgramIDs>"];
        for (NSString *ID in progIDs)
        {
            [soap appendString:[NSString stringWithFormat:@"<int>%@</int>", ID]];
        }
        [soap appendString:@"</ProgramIDs>"];
    }
    
    [soap appendString:@"<OnlineOnly>true</OnlineOnly></Request></GetSessionTypes></soapenv:Body></soapenv:Envelope>"];
    
    NSURL *url = [NSURL URLWithString:ENDPOINT_SITE];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request addValue:CONTENT_TYPE forHTTPHeaderField:@"Content-Type"];
    [request addValue:[NSString stringWithFormat:API_ENDPOINT, @"GetSessionTypes"] forHTTPHeaderField:@"SOAPAction"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody: [soap dataUsingEncoding:NSUTF8StringEncoding]];
    
    return request;
}

@end
