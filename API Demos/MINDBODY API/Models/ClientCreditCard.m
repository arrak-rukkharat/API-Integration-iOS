//
//  ClientCreditCard.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/2/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientCreditCard.h"

@implementation ClientCreditCard

- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"CardHolder"])
    {
        self.CardHolder = [Utils concate:self.CardHolder :string];
    }
    else if ([element isEqualToString:@"CardNumber"])
    {
        self.CardNumber = [Utils concate:self.CardNumber :string];
    }
    else if ([element isEqualToString:@"CardType"])
    {
        self.CardType = [Utils concate:self.CardType :string];
    }
    else if ([element isEqualToString:@"Address"])
    {
        self.Address = [Utils concate:self.Address :string];
    }
    else if ([element isEqualToString:@"City"])
    {
        self.City = [Utils concate:self.City :string];
    }
    else if ([element isEqualToString:@"PostalCode"])
    {
        self.PostalCode = [Utils concate:self.PostalCode :string];
    }
    else if ([element isEqualToString:@"State"])
    {
        self.State = [Utils concate:self.State :string];
    }
    else if ([element isEqualToString:@"ExpMonth"])
    {
        self.ExpMonth = [Utils concate:self.ExpMonth :string];
    }
    else if ([element isEqualToString:@"ExpYear"])
    {
        self.ExpYear = [Utils concate:self.ExpYear :string];
    }
    else if ([element isEqualToString:@"LastFour"])
    {
        self.LastFour = [Utils concate:self.LastFour :string];
    }
}

@end
