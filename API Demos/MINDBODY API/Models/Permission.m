//
//  Permission.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/27/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Permission.h"

@implementation Permission
- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"Name"])
    {
        self.Name = [Utils concate:self.Name :string];
    }
    else if ([element isEqualToString:@"Value"])
    {
        self.Value = [Utils concate:self.Value :string];
    }
    else if ([element isEqualToString:@"DisplayName"])
    {
        self.DisplayName = [Utils concate:self.DisplayName :string];
    }
}

- (void)finish
{
    
}
@end
