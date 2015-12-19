//
//  ReceiptResult.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/28/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ReceiptResult.h"

@implementation ReceiptResult

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
    
    if ([element isEqualToString:@"Item"])
    {
        NSString *attr = [attributeDict valueForKey:@"xsi:type"];
        
        if ([attr isEqualToString:@"Product"])
        {
            product = [Product new];
            parentElementName = @"Product";
        }
        else if ([attr isEqualToString:@"Service"])
        {
            service = [Service new];
            parentElementName = @"Service";
        }
        else if ([attr isEqualToString:@"Package"])
        {
            package = [Package new];
            parentElementName = @"Package";
        }
    }
    else if ([element isEqualToString:@"ShoppingCart"])
    {
        self.Receipt = [Receipt new];
        parentElementName = @"ShoppingCart";
    }
    else if ([element isEqualToString:@"CartItem"])
    {
        cartItem = [CartItem new];
        parentElementName = @"CartItem";
    }
    else if ([element isEqualToString:@"CartItems"])
    {
        cartItems = [NSMutableArray new];
        parentElementName = @"CartItems";
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
    
    if ([parentElementName isEqualToString:@"ShoppingCart"])
    {
        [self.Receipt mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"CartItem"])
    {
        [cartItem mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Package"])
    {
        [package mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Service"])
    {
        [service mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Product"])
    {
        [product mapElement:element with:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"Item"])
    {
        if ([parentElementName isEqualToString:@"Product"])
        {
            [product finish];
            cartItem.Item = product;
        }
        else if ([parentElementName isEqualToString:@"Service"])
        {
            [service finish];
            cartItem.Item = service;
        }
        else if ([parentElementName isEqualToString:@"Package"])
        {
            [package finish];
            cartItem.Item = package;
        }
        parentElementName = @"CartItem";
    }
    else if ([elementName isEqualToString:@"CartItem"])
    {
        [cartItem finish];
        [cartItems addObject:cartItem];
        parentElementName = @"CartItems";
    }
    else if ([elementName isEqualToString:@"CartItems"])
    {
        
        self.Receipt.CartItems = (NSArray*)cartItems;
        parentElementName = @"ShoppingCart";
    }
    else if ([elementName isEqualToString:@"ShoppingCart"])
    {
        
        [self.Receipt finish];
    }
    
}

@end
