//
//  CoursesResult.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/14/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "CoursesResult.h"

@implementation CoursesResult

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
    
    if ([element isEqualToString:@"Courses"])
    {
        courses = [NSMutableArray new];
        parentElementName = @"Courses";
    }
    else if ([element isEqualToString:@"Organizer"])
    {
        staff = [Staff new];
        parentElementName = @"Organizer";
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
    else if ([element isEqualToString:@"Course"])
    {
        c = [Course new];
        parentElementName = @"Course";
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
    
    if ([parentElementName isEqualToString:@"Course"])
    {
        [c mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Organizer"])
    {
        [staff mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Location"])
    {
        [loc mapElement:element with:string];
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
    if ([elementName isEqualToString:@"Organizer"])
    {
        [staff finish];
        c.Organizer = staff;
        parentElementName = @"Course";
    }
    else if ([elementName isEqualToString:@"Course"])
    {
        [c finish];
        [courses addObject:c];
        parentElementName = @"Courses";
    }
    else if ([elementName isEqualToString:@"Location"])
    {
        [loc finish];
        c.Location = loc;
        parentElementName = @"Course";
    }
    else if ([elementName isEqualToString:@"Program"])
    {
        [prg finish];
        c.ServiceCategory = prg;
        parentElementName = @"Course";
    }
    else if ([elementName isEqualToString:@"Courses"])
    {
        self.Courses = (NSArray*)courses;
    }
}


@end
