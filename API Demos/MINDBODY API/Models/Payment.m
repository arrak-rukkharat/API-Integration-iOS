//
//  self.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/12/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Payment.h"

@implementation Payment

- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"Amount"])
    {
        self.Amount = [Utils concate:self.Amount :string];
    }
    else if ([element isEqualToString:@"Method"])
    {
        self.Method = [string intValue];
    }
    else if ([element isEqualToString:@"Type"])
    {
        self.Type = [Utils concate:self.Type :string];
    }
    else if ([element isEqualToString:@"Notes"])
    {
        self.Notes = [Utils concate:self.Notes :string];
    }
}

- (void)finish
{
    
}

@end
