//
//  Course.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/14/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Course.h"

@implementation Course
- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"Name"])
    {
        self.Name = [Utils concate:self.Name :string];
    }
    else if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"Description"])
    {
        self.Description = [Utils concate:self.Description :string];
    }
    else if ([element isEqualToString:@"Notes"])
    {
        self.Notes = [Utils concate:self.Notes :string];
    }
    else if ([element isEqualToString:@"StartDate"])
    {
        startDateString = [Utils concate:startDateString :string];
    }
    else if ([element isEqualToString:@"EndDate"])
    {
        endDateString = [Utils concate:endDateString :string];
    }
}

- (void)finish
{
    self.StartDate = [Utils convertISOToDate:startDateString];
    self.EndDate = [Utils convertISOToDate:endDateString];
}
@end
