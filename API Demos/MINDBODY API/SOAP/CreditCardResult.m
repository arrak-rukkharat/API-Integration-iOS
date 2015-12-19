//
//  GetClientCreditCardResult.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/3/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "CreditCardResult.h"

@implementation CreditCardResult
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
    
    if ([element isEqualToString:@"Status"])
    {
        self.Status = @"";
    }
    else if ([element isEqualToString:@"Message"])
    {
        self.Message = @"";
    }
    else if ([element isEqualToString:@"ClientCreditCard"])
    {
        card = [ClientCreditCard new];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    // Result
    if ([element isEqualToString:@"Status"]) self.Status = [Utils concate:self.Status :string];
    else if ([element isEqualToString:@"ErrorCode"]) self.ErrorCode = [string intValue];
    else if ([element isEqualToString:@"ResultCount"]) self.ResultCount = [string intValue];
    else if ([element isEqualToString:@"Message"])
    {
        self.Message = [Utils concate:self.Message :string];
    }
    
    // Credit card info
    [card mapElement:element with:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"ClientCreditCard"])
    {
        [card finish];
        self.CreditCard = card;
    }
}
@end
