//
//  ClassDescription.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 9/25/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClassDescription.h"

@implementation ClassDescription


- (void)mapElement:(NSString*)element with:(NSString*)string
{

    if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"Name"])
    {
        self.Name = [Utils concate:self.Name :string];
    }
    else if ([element isEqualToString:@"ImageURL"])
    {
        self.ImageURL = [Utils concate:self.ImageURL :string];
    }
    else if ([element isEqualToString:@"Description"])
    {
        self.Description = [Utils concate:self.Description :string];
    }
    else if ([element isEqualToString:@"Prereq"])
    {
        self.Prereq = [Utils concate:self.Prereq :string];
    }
    else if ([element isEqualToString:@"Notes"])
    {
        self.Notes = [Utils concate:self.Notes :string];
    }
    else if ([element isEqualToString:@"LastUpdated"])
    {
        lastUpdated = [Utils concate:lastUpdated :string];;
    }
}

- (void)finish
{
    //self.LastUpdated = [Utils convertISOToDate:lastUpdated];
}



@end
