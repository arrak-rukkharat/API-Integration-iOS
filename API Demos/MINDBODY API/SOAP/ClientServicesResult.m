//
//  ClientServicesResult.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/10/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientServicesResult.h"

@implementation ClientServicesResult
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
    
    if ([element isEqualToString:@"Program"])
    {
        prg = [ServiceCategory new];
        parentElementName = @"Program";
    }
    else if ([element isEqualToString:@"ClientService"])
    {
        service = [PurchasedService new];
        parentElementName = @"ClientService";
    }
    else if ([element isEqualToString:@"ClientServices"])
    {
        self.Services = [NSMutableArray new];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
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
    
    if ([parentElementName isEqualToString:@"Program"])
    {
        [prg mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"ClientService"])
    {
        [service mapElement:element with:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"Program"])
    {
        [prg finish];
        service.ServiceCategory = prg;
        parentElementName = @"ClientService";
    }
    else if ([elementName isEqualToString:@"ClientService"])
    {
        [service finish];
        [self.Services addObject:service];
    }
}
@end
