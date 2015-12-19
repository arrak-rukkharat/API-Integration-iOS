//
//  GetStaffResult.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/23/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "StaffMembersResult.h"

@implementation StaffMembersResult


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
    
    if ([element isEqualToString:@"Status"])
    {
        self.Status = @"";
    }
    else if ([element isEqualToString:@"StaffMembers"])
    {
        staffMembers = [NSMutableArray new];
    }
    
    // Staff
    else if ([element isEqualToString:@"Staff"])
    {
        staff = [Staff new];
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
    [staff mapElement:element with:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // Finish staff
    if ([elementName isEqualToString:@"Staff"])
    {
        [staff finish];
        [staffMembers addObject:staff];
    }
    else if ([elementName isEqualToString:@"StaffMembers"])
    {
        self.StaffMembers = (NSArray*)staffMembers;
    }
}

@end
