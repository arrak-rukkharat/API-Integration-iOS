#import "ClassResult.h"
#import "C1ass.h"
#import "Location.h"
#import "ServiceCategory.h"

@implementation ClassResult

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
    
    if ([element isEqualToString:@"Class"])
    {
        c = [C1ass new];
        parentElementName = @"Class";
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
    
    if ([parentElementName isEqualToString:@"Class"])
    {
        [c mapElement:element with:string];
    }
    else if ([parentElementName isEqualToString:@"Client"])
    {
        [client mapElement:element with:string];
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
        parentElementName = @"Class";
    }
    else if ([elementName isEqualToString:@"Client"])
    {
        [client finish];
        c.Client = client;
        parentElementName = @"Class";
    }
    else if ([elementName isEqualToString:@"Location"])
    {
        c.Location = loc;
        parentElementName = @"Class";
    }
    else if ([elementName isEqualToString:@"ClassDescription"])
    {
        c.ClassDescription = classDes;
        parentElementName = @"Class";
    }
    else if ([elementName isEqualToString:@"Program"])
    {
        classDes.ServiceCategory = prg;
        parentElementName = @"ClassDescription";
    }
    else if ([elementName isEqualToString:@"SessionType"])
    {
        c.ClassDescription = classDes;
        parentElementName = @"ClassDescription";
    }
    else if ([elementName isEqualToString:@"Class"])
    {
        [c finish];
        self.Class = c;
    }
}
@end
