//
//  Receipt.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/28/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Receipt.h"

@implementation Receipt
- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"SubTotal"])
    {
        self.SubTotal = [Utils concate:self.SubTotal :string];
    }
    else if ([element isEqualToString:@"DiscountTotal"])
    {
        self.DiscountTotal = [Utils concate:self.DiscountTotal :string];
    }
    else if ([element isEqualToString:@"TaxTotal"])
    {
        self.TaxTotal = [Utils concate:self.TaxTotal :string];
    }
    else if ([element isEqualToString:@"GrandTotal"])
    {
        self.GrandTotal = [Utils concate:self.GrandTotal :string];
    }
}

- (void)finish
{
    
}

@end
