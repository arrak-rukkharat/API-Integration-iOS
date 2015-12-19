//
//  GetClientVisitResult.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/4/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "VisitsResult.h"

@implementation VisitsResult
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
    if ([element isEqualToString:@"Visits"])
    {
        self.Visits = [NSMutableArray new];
    }
    else if ([element isEqualToString:@"Visit"])
    {
        visit = [Visit new];
        parentElementName = @"Visit";
    }
    else if ([element isEqualToString:@"Staff"])
    {
        staff = [Staff new];
        parentElementName = @"staff";
    }
    else if ([element isEqualToString:@"Location"])
    {
        loc = [Location new];
        parentElementName = @"location";
    }
    else if ([element isEqualToString:@"Client"])
    {
        client = [Client new];
        parentElementName = @"Client";
    }
    else if ([element isEqualToString:@"Service"])
    {
        service = [Service new];
        parentElementName = @"Service";
    }
    else if ([element isEqualToString:@"Program"])
    {
        Program = [ServiceCategory new];
        parentElementName = @"Program";
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
    
    if ([parentElementName isEqualToString:@"Visit"])
    {
        [visit mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"location"])
    {
        [loc mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"staff"])
    {
        [staff mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Service"])
    {
        [service mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Client"])
    {
        [client mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Program"])
    {
        [Program mapElement:element with:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"Visit"])
    {
        [visit finish];
        [self.Visits addObject:visit];
        parentElementName = @"Visit"; // backtrack
    }
    else if ([elementName isEqualToString:@"Staff"])
    {
        [staff finish];
        visit.Staff = staff;
        parentElementName = @"Visit"; // backtrack
    }
    else if ([elementName isEqualToString:@"Location"])
    {
        [loc finish];
        visit.Location = loc;
        parentElementName = @"Visit"; // backtrack
    }
    else if ([elementName isEqualToString:@"Client"])
    {
        [client finish];
        visit.Client = client;
        parentElementName = @"Visit"; // backtrack
    }
    else if ([elementName isEqualToString:@"Service"])
    {
        [service finish];
        visit.Service = service;
        parentElementName = @"Visit"; // backtrack
    }
    else if ([elementName isEqualToString:@"Program"])
    {
        //[Program finish];
        service.ServiceCategory = Program;
        parentElementName = @"Service"; // backtrack
    }
}

@end
