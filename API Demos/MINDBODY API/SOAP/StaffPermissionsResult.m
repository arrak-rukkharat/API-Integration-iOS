//
//  GetStaffPermissionsResult.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/27/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "StaffPermissionsResult.h"

@implementation StaffPermissionsResult

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
    
    if ([element isEqualToString:@"Permissions"])
    {
        permissions = [NSMutableArray new];
    }
    else if ([element isEqualToString:@"Permission"])
    {
        per = [Permission new];
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
    
    [per mapElement:element with:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"Permission"])
    {
        [permissions addObject:per];
    }
    else if ([elementName isEqualToString:@"Permissions"])
    {
        self.Permissions = (NSArray*)permissions;
    }
}

@end
