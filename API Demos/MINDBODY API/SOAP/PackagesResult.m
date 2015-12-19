//
//  PackagesResult.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/20/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "PackagesResult.h"

@implementation PackagesResult

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
    else if ([element isEqualToString:@"Product"])
    {
        product = [Product new];
        parentElementName = @"Product";
    }
    else if ([element isEqualToString:@"Products"])
    {
        products = [NSMutableArray new];
        parentElementName = @"Products";
    }
    else if ([element isEqualToString:@"Packages"])
    {
        packages = [NSMutableArray new];
        parentElementName = @"Packages";
    }
    else if ([element isEqualToString:@"Package"])
    {
        package = [Package new];
        parentElementName = @"Package";
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
    
    
    if ([parentElementName isEqualToString:@"Package"])
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
    if ([elementName isEqualToString:@"Service"])
    {
        [services addObject:service];
        parentElementName = @"Services";
    }
    else if ([elementName isEqualToString:@"Services"])
    {
        package.Services = (NSArray*)services;
        parentElementName = @"Package";
    }
    else if ([elementName isEqualToString:@"Product"])
    {
        [products addObject:product];
    }
    else if ([elementName isEqualToString:@"Products"])
    {
        package.Products = (NSArray*)products;
        parentElementName = @"Package";
    }
    else if ([elementName isEqualToString:@"Packages"])
    {
        self.Packages = (NSArray*)packages;
    }
    else if ([elementName isEqualToString:@"Package"])
    {
        [packages addObject:package];
    }
}

@end
