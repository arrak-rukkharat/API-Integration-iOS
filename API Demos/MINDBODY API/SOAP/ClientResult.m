//
//  AddClientResult.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/1/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientResult.h"

@implementation ClientResult

- (void)mapData:(NSData*)data
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    
    parentElementName = @"";
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    element = elementName;

    if ([element isEqualToString:@"Client"])
    {
        client = [Client new];
        birthDateString = @"";
        firstAppointmentDateString = @"";
        parentElementName = @"client";
    }
    else if ([element isEqualToString:@"HomeLocation"])
    {
        loc = [Location new];
        parentElementName = @"location";
    }
    else if ([element isEqualToString:@"AdditionalImageURLs"])
    {
        additionalImageUrls = [NSMutableArray new];
        parentElementName = @"AdditionalImageURLs";
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    // Result
    if ([element isEqualToString:@"Status"])
    {
        self.Status = [Utils concate:self.Status :string];
    }
    else if ([element isEqualToString:@"ErrorCode"])
    {
        self.ErrorCode = [string intValue];
    }
    else if ([element isEqualToString:@"ResultCount"])
    {
        self.ResultCount = [string intValue];
    }
    else if ([element isEqualToString:@"Message"])
    {
        self.Message = [Utils concate:self.Message :string];
    }
    
    if ([parentElementName isEqualToString:@"client"])
    {
        [client mapElement:element with:string];
    }
    
    // Client Location
    if ([parentElementName isEqualToString:@"AdditionalImageURLs"])
    {
        if ([element isEqualToString:@"string"])
        {
            imageUrl = [Utils concate:imageUrl :string];
        }
    }
    
    // Client Location
    if ([parentElementName isEqualToString:@"location"])
    {
        [loc mapElement:element with:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // Finish staff
    if ([elementName isEqualToString:@"Client"])
    {
        [client finish];
        self.Client = client;
    }
    else if ([elementName isEqualToString:@"HomeLocation"])
    {
        [loc finish];
        client.HomeLocation = loc;
        parentElementName = @"client";
    }
    else if ([elementName isEqualToString:@"AdditionalImageURLs"])
    {
        loc.AdditionalImageURLs = additionalImageUrls;
    }
    else if ([parentElementName isEqualToString:@"AdditionalImageURLs"])
    {
        if ([elementName isEqualToString:@"string"])
        {
            [additionalImageUrls addObject:imageUrl];
        }
    }
}
@end
