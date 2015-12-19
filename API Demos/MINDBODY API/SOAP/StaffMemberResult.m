//
//  AddStaffResult.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/26/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "StaffMemberResult.h"

@implementation StaffMemberResult

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
    
    if ([element isEqualToString:@"Staff"])
    {
        staff = [Staff new];
        parentElementName = @"Staff";
    }
    else if ([element isEqualToString:@"LoginLocations"])
    {
        locations = [NSMutableArray new];
        parentElementName = @"LoginLocations";
    }
    else if ([element isEqualToString:@"Location"])
    {
        loc = [Location new];
        parentElementName = @"Location";
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
    if ([parentElementName isEqualToString:@"Staff"])
    {
        [staff mapElement:element with:string];
        
        if ([element isEqualToString:@"UserAccessLevel"])
        {
            accessLevel = [Utils concate:accessLevel :string];
        }
    }
    // Location
    else if ([parentElementName isEqualToString:@"Location"])
    {
        [loc mapElement:element with:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // Finish staff
    if ([elementName isEqualToString:@"Staff"])
    {
        UserAccessLevel lvl = UserAccessLevelNone;
        if ([accessLevel isEqualToString:@"Consumer"])
        {
            lvl = UserAccessLevelConsumer;
        }
        else if ([accessLevel isEqualToString:@"Staff"])
        {
            lvl = UserAccessLevelStaff;
        }
        else if ([accessLevel isEqualToString:@"Partner"])
        {
            lvl = UserAccessLevelPartner;
        }
        else if ([accessLevel isEqualToString:@"Owner"])
        {
            lvl = UserAccessLevelOwner;
        }
        else if ([accessLevel isEqualToString:@"Admin"])
        {
            lvl = UserAccessLevelAdmin;
        }
        
        staff.AccessLevel = lvl;
        [staff finish];
        self.Staff = staff;
    }
    else if ([elementName isEqualToString:@"LoginLocations"])
    {
        self.Staff.LoginLocations = locations;
        parentElementName = @"Staff";
    }
    else if ([elementName isEqualToString:@"Location"])
    {
        [loc finish];
        [locations addObject:loc];
        parentElementName = @"LoginLocations";
    }
}
@end
