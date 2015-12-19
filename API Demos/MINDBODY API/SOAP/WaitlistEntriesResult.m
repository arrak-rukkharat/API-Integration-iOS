//
//  WaitlistEntriesResult.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/21/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "WaitlistEntriesResult.h"

@implementation WaitlistEntriesResult
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
    
    if ([element isEqualToString:@"WaitlistEntries"])
    {
        wl = [NSMutableArray new];
        parentElementName = @"WaitlistEntries";
    }
    else if ([element isEqualToString:@"WaitlistEntry"])
    {
        we = [WaitlistEntry new];
        parentElementName = @"WaitlistEntry";
    }
    else if ([element isEqualToString:@"ClassSchedule"])
    {
        sch = [ClassSchedule new];
        parentElementName = @"ClassSchedule";
    }
    else if ([element isEqualToString:@"Staff"])
    {
        staff = [Staff new];
        parentElementName = @"Staff";
    }
    else if ([element isEqualToString:@"Location"])
    {
        loc = [Location new];
        parentElementName = @"Location";
    }
    else if ([element isEqualToString:@"HomeLocation"])
    {
        cloc = [Location new];
        parentElementName = @"HomeLocation";
    }
    else if ([element isEqualToString:@"Program"])
    {
        prg = [ServiceCategory new];
        parentElementName = @"Program";
    }
    else if ([element isEqualToString:@"SessionType"])
    {
        sess = [SessionType new];
        parentElementName = @"SessionType";
    }
    else if ([element isEqualToString:@"ClassDescription"])
    {
        classDes = [ClassDescription new];
        parentElementName = @"ClassDescription";
    }
    else if ([element isEqualToString:@"Client"])
    {
        client = [Client new];
        parentElementName = @"Client";
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
    
    if ([parentElementName isEqualToString:@"ClassSchedule"])
    {
        [sch mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"ClassDescription"])
    {
        [classDes mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Staff"])
    {
        [staff mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Location"])
    {
        [loc mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"HomeLocation"])
    {
        [cloc mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"SessionType"])
    {
        [sess mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Program"])
    {
        [prg mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"WaitlistEntry"])
    {
        [we mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Client"])
    {
        [client mapElement:element with:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // Finish staff
    if ([elementName isEqualToString:@"Staff"])
    {
        [staff finish];
        sch.Staff = staff;
        parentElementName = @"ClassSchedule";
    }
    else if ([elementName isEqualToString:@"Location"])
    {
        [loc finish];
        sch.Location = loc;
        parentElementName = @"ClassSchedule";
    }
    else if ([elementName isEqualToString:@"HomeLocation"])
    {
        [cloc finish];
        client.HomeLocation = cloc;
        parentElementName = @"Client";
    }
    else if ([elementName isEqualToString:@"ClassDescription"])
    {
        [classDes finish];
        sch.ClassDescription = classDes;
        parentElementName = @"ClassSchedule";
    }
    else if ([elementName isEqualToString:@"Program"])
    {
        [prg finish];
        classDes.ServiceCategory = prg;
        parentElementName = @"ClassDescription";
    }
    else if ([elementName isEqualToString:@"SessionType"])
    {
        [sess finish];
        classDes.SessionType = sess;
        parentElementName = @"ClassDescription";
    }
    else if ([elementName isEqualToString:@"ClassSchedule"])
    {
        [sch finish];
        we.ClassSchedule = sch;
        parentElementName = @"WaitlistEntry";
    }
    else if ([elementName isEqualToString:@"WaitlistEntry"])
    {
        [we finish];
        [wl addObject:we];
        parentElementName = @"WaitlistEntries";
    }
    else if ([elementName isEqualToString:@"WaitlistEntries"])
    {
        self.WaitlistEntries = (NSArray*)wl;
    }
}
@end
