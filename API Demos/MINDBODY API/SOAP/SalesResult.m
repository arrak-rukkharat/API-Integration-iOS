//
//  SalesResult.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/18/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "SalesResult.h"

@implementation SalesResult

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
    
    if ([element isEqualToString:@"Sales"])
    {
        sales = [NSMutableArray new];
    }
    else if ([element isEqualToString:@"Sale"])
    {
        sale = [Sale new];
        saleDate = nil;
        saleTime = nil;
        saleDateTime = nil;
        parentElementName = @"Sale";
    }
    else if ([element isEqualToString:@"Payments"])
    {
        payments = [NSMutableArray new];
        parentElementName = @"Payments";
    }
    else if ([element isEqualToString:@"Payment"])
    {
        payment = [Payment new];
        parentElementName = @"Payment";
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
    
    if ([parentElementName isEqualToString:@"Sale"])
    {
        [sale mapElement:element with:string];
    }
    
    else if ([parentElementName isEqualToString:@"Payment"])
    {
        [payment mapElement:element with:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"Sales"])
    {
        self.Sales = (NSArray*)sales;
    }
    else if ([elementName isEqualToString:@"Sale"])
    {
        sale.Payments = (NSArray*)payments;
        
        [sales addObject:sale];
        
        parentElementName = @"Sales";
    }
    else if ([elementName isEqualToString:@"Payments"])
    {
        parentElementName = @"Sale";
    }
    else if ([elementName isEqualToString:@"Payment"])
    {
        [payments addObject:payment];
        parentElementName = @"Payments";
    }
}

@end
