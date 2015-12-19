//
//  ServicesResult.m
//  MB API Driver
//
//  Created by Arrak Rukkharat on 8/19/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ServicesResult.h"

@implementation ServicesResult
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
    
    if ([element isEqualToString:@"Service"])
    {
        service = [Service new];
        parentElementName = @"Service";
    }
    else if ([element isEqualToString:@"Services"])
    {
        services = [NSMutableArray new];
        parentElementName = @"Services";
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
    
    if ([parentElementName isEqualToString:@"Service"])
    {
        [service mapElement:element with:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"Service"])
    {
        [services addObject:service];
    }
    if ([elementName isEqualToString:@"Services"])
    {
        self.Services = (NSArray*)services;
    }
}
@end
