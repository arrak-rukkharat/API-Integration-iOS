//
//  Sale.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/12/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Sale.h"

@implementation Sale

- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"SaleTime"])
    {
        saleTime = [Utils concate:saleTime :string];
    }
    else if ([element isEqualToString:@"SaleDate"])
    {
        saleDate = [Utils concate:saleDate :string];
    }
    else if ([element isEqualToString:@"SaleDateTime"])
    {
        saleDateTime = [Utils concate:saleDateTime :string];
    }
}

- (void)finish
{
    self.SaleDate = [Utils stringToDate:saleDate format:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    self.SaleTime = [Utils convertISOToDate:saleTime];
    self.SaleDateTime = [Utils stringToDate:saleDateTime format:@"yyyy-MM-dd'T'HH:mm:ssZ"];
}

@end
