//
//  Program.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ServiceCategory.h"

@implementation ServiceCategory
- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"Name"])
    {
        self.Name = [Utils concate:self.Name :string];
    }
    else if ([element isEqualToString:@"ScheduleType"])
    {
        self.ScheduleType = string;
    }
    else if ([element isEqualToString:@"CancelOffset"])
    {
        self.CancelOffset = [string intValue];
    }
}

- (void)finish
{
    
}

@end
