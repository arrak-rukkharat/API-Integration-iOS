//
//  ClientReferralTypesResult.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/11/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientReferralTypesResult.h"

@implementation ClientReferralTypesResult
- (void)mapData:(NSData*)data
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    element = elementName;
    
    if ([element isEqualToString:@"ReferralTypes"])
    {
        types = [NSMutableArray new];
    }
    else if ([element isEqualToString:@"string"])
    {
        name = nil;
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
    
    // Staff detail
    else if ([element isEqualToString:@"string"])
    {
        name = [Utils concate:name :string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // Finish staff
    if ([elementName isEqualToString:@"string"])
    {
        [types addObject:name];
    }
    else if ([elementName isEqualToString:@"ReferralTypes"])
    {
        self.ReferralTypes = (NSArray*)types;
    }
}
@end
