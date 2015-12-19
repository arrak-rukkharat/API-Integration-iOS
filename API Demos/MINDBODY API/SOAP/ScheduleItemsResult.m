//
//  ScheduleItemsResult.m
//  MBAPI
//
//  Created by Blackbolt on 11/12/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ScheduleItemsResult.h"

@implementation ScheduleItemsResult
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
    
    if ([element isEqualToString:@"ScheduleItems"])
    {
        array = [NSMutableArray new];
        parentElementName = @"ScheduleItems";
    }
    else if ([element isEqualToString:@"ScheduleItem"])
    {
        item = [ScheduleItem new];
        parentElementName = @"ScheduleItem";
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
    else if ([element isEqualToString:@"SessionType"])
    {
        sess = [SessionType new];
        parentElementName = @"SessionType";
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
    
    if ([parentElementName isEqualToString:@"ScheduleItem"])
    {
        [item mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Staff"])
    {
        [staff mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Location"])
    {
        [loc mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"SessionType"])
    {
        [sess mapElement:element with:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // Finish staff
    if ([elementName isEqualToString:@"Staff"])
    {
        [staff finish];
        item.Staff = staff;
        parentElementName = @"ScheduleItem";
    }
    else if ([elementName isEqualToString:@"Location"])
    {
        [loc finish];
        item.Location = loc;
        parentElementName = @"ScheduleItem";
    }
    else if ([elementName isEqualToString:@"SessionType"])
    {
        [sess finish];
        item.SessionType = sess;
        parentElementName = @"ScheduleItem";
    }
    else if ([elementName isEqualToString:@"ScheduleItem"])
    {
        [item finish];
        [array addObject:item];
        parentElementName = @"ScheduleItems";
    }
    else if ([elementName isEqualToString:@"ScheduleItems"])
    {
        self.ScheduleItems = (NSArray*)array;
    }
}
@end
