//
//  ClassSchedulesResult.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/10/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClassSchedulesResult.h"

@implementation ClassSchedulesResult

- (void)mapData:(NSData*)data
{
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    parentElementName = @"";
    isEnrollments = false;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    element = elementName;
    //element = [[NSString alloc] initWithString:elementName];
    
    if ([element isEqualToString:@"ClassSchedules"])
    {
        classSche = [NSMutableArray new];
        parentElementName = @"ClassSchedules";
    }
    else if ([element isEqualToString:@"Enrollments"])
    {
        classSche = [NSMutableArray new];
        parentElementName = @"Enrollments";
        isEnrollments = true;
    }
    else if ([element isEqualToString:@"ClassSchedule"])
    {
        c = [ClassSchedule new];
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
        [c mapElement:element with:string];
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
    else if ([parentElementName isEqualToString:@"SessionType"])
    {
        [sess mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Program"])
    {
        [prg mapElement:element with:string];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // Finish staff
    if ([elementName isEqualToString:@"Staff"])
    {
        c.Staff = staff;
        parentElementName = @"ClassSchedule";
    }
    else if ([elementName isEqualToString:@"Location"])
    {
        c.Location = loc;
        parentElementName = @"ClassSchedule";
    }
    else if ([elementName isEqualToString:@"ClassDescription"])
    {
        c.ClassDescription = classDes;
        parentElementName = @"ClassSchedule";
    }
    else if ([elementName isEqualToString:@"Program"])
    {
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
        [c finish];
        [classSche addObject:c];
        parentElementName = @"ClassSchedules";
    }
    else if ([elementName isEqualToString:@"ClassSchedules"])
    {
        self.ClassSchedules = classSche;
    }
    else if ([elementName isEqualToString:@"Enrollments"])
    {
        self.ClassSchedules = classSche;
        parentElementName = nil;
    }
}

@end
