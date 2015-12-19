//
//  SessionType.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "SessionType.h"

@implementation SessionType
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
    else if ([element isEqualToString:@"DefaultTimeLength"])
    {
        self.DefaultTimeLength = [string intValue];
    }
    else if ([element isEqualToString:@"NumDeducted"])
    {
        self.NumDeducted = [string intValue];
    }
    else if ([element isEqualToString:@"ProgramID"])
    {
        self.ServiceCategoryID = string;
    }
}

- (void)finish
{
    
}

@end
