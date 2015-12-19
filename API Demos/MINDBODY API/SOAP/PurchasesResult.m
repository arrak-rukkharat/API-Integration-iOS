//
//  PurchasesResult.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/12/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "PurchasesResult.h"

@implementation PurchasesResult
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
    
    // Main node
    if ([element isEqualToString:@"Purchases"])
    {
        purchases = [NSMutableArray new];
    }
    else if ([element isEqualToString:@"SaleItem"])
    {
        saleItem = [SaleItem new];
        parentElementName = @"SaleItem";
    }
    else if ([element isEqualToString:@"Sale"])
    {
        sale = [Sale new];
        parentElementName = @"Sale";
    }
    else if ([element isEqualToString:@"Location"])
    {
        loc = [Location new];
        parentElementName = @"Location";
    }
    else if ([element isEqualToString:@"Payments"])
    {
        payments = [NSMutableArray new];
        parentElementName = @"Sale";
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
    
    if ([parentElementName isEqualToString:@"SaleItem"])
    {
        [saleItem mapElement:element with:string];
    }
    
    // Location
    else if ([parentElementName isEqualToString:@"Location"])
    {
        [loc mapElement:element with:string];
    }
    
    else if ([parentElementName isEqualToString:@"Sale"])
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
    if ([elementName isEqualToString:@"Purchases"])
    {
        self.Purchases = (NSArray*)purchases;
    }
    else if ([elementName isEqualToString:@"SaleItem"])
    {
        [purchases addObject:saleItem];
        parentElementName = @"Purchases";
    }
    else if ([elementName isEqualToString:@"Sale"])
    {
        sale.Location = loc;
        sale.Payments = (NSArray*)payments;
        [sale finish];
        
        saleItem.Sale = sale;
        parentElementName = @"SaleItem";
    }
    else if ([elementName isEqualToString:@"Location"])
    {
        parentElementName = @"Sale";
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
