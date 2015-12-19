//
//  self.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/12/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "SaleItem.h"

@implementation SaleItem

- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"Description"])
    {
        self.DescriptionText = [Utils concate:self.DescriptionText :string];
    }
    else if ([element isEqualToString:@"Price"])
    {
        self.Price = [Utils concate:self.Price :string];
    }
    else if ([element isEqualToString:@"AmountPaid"])
    {
        self.AmountPaid = [Utils concate:self.AmountPaid :string];
    }
    else if ([element isEqualToString:@"Discount"])
    {
        self.Discount = [Utils concate:self.Discount :string];
    }
    else if ([element isEqualToString:@"Tax"])
    {
        self.Tax = [Utils concate:self.Tax :string];
    }
    else if ([element isEqualToString:@"Returned"])
    {
        self.Returned = [string boolValue];
    }
    else if ([element isEqualToString:@"Quantity"])
    {
        self.Quantity = [Utils concate:self.Quantity :string];
    }
}

- (void)finish
{
    
}

@end
