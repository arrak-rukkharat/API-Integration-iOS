//
//  PaymentInfo.m
//  API Demos
//
//  Created by Blackbolt on 12/9/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "PaymentInfo.h"

@implementation PaymentInfo

- (id)init
{
    if (self = [super init])
    {
        self.SendEmail = NO;
        self.AmountTotal = @"0";
        self.Promocode = nil;
    }
    return self;
}

@end
