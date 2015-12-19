//
//  ClientMembershipsResult.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/29/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientMembershipsResult.h"

@implementation ClientMembershipsResult
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
    else if ([element isEqualToString:@"ClientMembership"])
    {
        membership = [ClientMembership new];
        
        parentElementName = @"ClientMembership";
    }
    else if ([element isEqualToString:@"ClientMemberships"])
    {
        self.ClientMemberships = [NSMutableArray new];
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
    else if ([parentElementName isEqualToString:@"ClientMembership"])
    {
        [membership mapElement:element with:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"Program"])
    {
        membership.ServiceCategory = prg;
        parentElementName = @"ClientMembership";
    }
    else if ([elementName isEqualToString:@"ClientMembership"])
    {
        [membership finish];
        
        [self.ClientMemberships addObject:membership];
    }
}
@end
