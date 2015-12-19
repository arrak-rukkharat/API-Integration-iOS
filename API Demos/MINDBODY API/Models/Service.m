//
//  self.m
//  MB API Driver
//
//  Created by Arrak Rukkharat on 8/19/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Service.h"

@implementation Service
- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"TaxRate"])
    {
        self.TaxRate = [Utils concate:self.TaxRate :string];
    }
    else if ([element isEqualToString:@"Count"])
    {
        self.Count = [string intValue];
    }
    else if ([element isEqualToString:@"Current"])
    {
        self.Current = [string boolValue];
    }
    else if ([element isEqualToString:@"Name"])
    {
        self.Name = [Utils concate:self.Name :string];
    }
    else if ([element isEqualToString:@"Price"])
    {
        self.Price = [Utils concate:self.Price :string];
    }
    else if ([element isEqualToString:@"OnlinePrice"])
    {
        self.OnlinePrice = [Utils concate:self.OnlinePrice :string];
    }
    else if ([element isEqualToString:@"PaymentDate"])
    {
        paymentDateString = [Utils concate:paymentDateString :string];
    }
    else if ([element isEqualToString:@"ActiveDate"])
    {
        activeDateString = [Utils concate:activeDateString :string];
    }
    else if ([element isEqualToString:@"ExpirationDate"])
    {
        expDateString = [Utils concate:expDateString :string];
    }
}

- (void)finish
{
    self.PaymentDate = [Utils convertISOToDate:paymentDateString];
    self.ActiveDate = [Utils convertISOToDate:activeDateString];
    self.ExpirationDate = [Utils convertISOToDate:expDateString];
}

@end
