//
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/19/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Package.h"

@implementation Package

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
    else if ([element isEqualToString:@"DiscountPercentage"])
    {
        self.DiscountPercentage = [Utils concate:self.DiscountPercentage :string];
    }
    else if ([element isEqualToString:@"SellOnline"])
    {
        self.SellOnline = [string boolValue];
    }
}

- (void)finish
{
    
}

@end
