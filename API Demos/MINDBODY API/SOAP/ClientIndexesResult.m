//
//  GetClientIndexesResult.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/6/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientIndexesResult.h"

@implementation ClientIndexesResult
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
    if ([element isEqualToString:@"ClientIndexes"])
    {
        self.ClientIndexes = [NSMutableArray new];
    }
    else if ([element isEqualToString:@"ClientIndex"])
    {
        parentElementName = @"ClientIndex";
        index = [ClientIndex new];
    }
    else if ([element isEqualToString:@"Values"])
    {
        index.Values = [NSMutableArray new];
    }
    else if ([element isEqualToString:@"ClientIndexValue"])
    {
        parentElementName = @"ClientIndexValue";
        indexValue = [IndexValue new];
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
    
    if ([parentElementName isEqualToString:@"ClientIndex"])
    {
        [index mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"ClientIndexValue"])
    {
        [indexValue mapElement:element with:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"ClientIndex"])
    {
        [self.ClientIndexes addObject:index];
    }
    else if ([elementName isEqualToString:@"Values"])
    {
        parentElementName = @"ClientIndex";
    }
    else if ([elementName isEqualToString:@"ClientIndexValue"])
    {
        parentElementName = @"ClientIndex";
        [index.Values addObject:indexValue];
    }
}
@end
