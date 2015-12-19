//
//  GetClientAccountBalancesResult.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/5/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientAccountBalancesResult.h"

@implementation ClientAccountBalancesResult
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
    else if ([element isEqualToString:@"Message"])
    {
        self.Message = [Utils concate:self.Message :string];
    }
    else if ([element isEqualToString:@"ResultCount"])
    {
        self.ResultCount = [string intValue];
    }
    else if ([element isEqualToString:@"AccountBalance"])
    {
        self.AccountBalance = [Utils concate:self.AccountBalance :string];
    }
    else if ([element isEqualToString:@"ID"])
    {
        client.ID = [Utils concate:client.ID :string];
    }
    else if ([element isEqualToString:@"FirstName"])
    {
        client.FirstName = [Utils concate:client.FirstName :string];
    }
    else if ([element isEqualToString:@"LastName"])
    {
        client.LastName = [Utils concate:client.LastName :string];
    }
    else if ([element isEqualToString:@"Gender"])
    {
        client.Gender = [Utils concate:client.Gender :string];
    }
    else if ([element isEqualToString:@"YellowAlert"])
    {
        client.YellowAlert = [Utils concate:client.YellowAlert :string];
    }
    else if ([element isEqualToString:@"RedAlert"])
    {
        client.RedAlert = [Utils concate:client.RedAlert :string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"Client"])
    {
        self.Client = client;
    }
}
@end
