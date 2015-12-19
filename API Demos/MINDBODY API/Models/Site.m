//
//  Site.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Site.h"

@implementation Site

- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"AcceptsVisa"])
    {
        self.AcceptsVisa = [string boolValue];
    }
    else if ([element isEqualToString:@"AcceptsDiscover"])
    {
        self.AcceptsDiscover = [string boolValue];
    }
    else if ([element isEqualToString:@"AcceptsMasterCard"])
    {
        self.AcceptsMasterCard = [string boolValue];
    }
    else if ([element isEqualToString:@"AcceptsAmericanExpress"])
    {
        self.AcceptsAmericanExpress = [string boolValue];
    }
    else if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"Name"])
    {
        self.Name = [Utils concate:self.Name :string];
    }
    else if ([element isEqualToString:@"Description"])
    {
        self.DescriptionText = [Utils concate:self.DescriptionText :string];
    }
    else if ([element isEqualToString:@"ContactEmail"])
    {
        self.ContactEmail = [Utils concate:self.ContactEmail :string];
    }
    else if ([element isEqualToString:@"LogoURL"])
    {
        self.LogoURL = [Utils concate:self.LogoURL :string];
    }
    else if ([element isEqualToString:@"PageColor1"])
    {
        self.PageColor1 = [Utils concate:self.PageColor1 :string];
    }
    else if ([element isEqualToString:@"PageColor2"])
    {
        self.PageColor2 = [Utils concate:self.PageColor2 :string];
    }
    else if ([element isEqualToString:@"PageColor3"])
    {
        self.PageColor3 = [Utils concate:self.PageColor3 :string];
    }
    else if ([element isEqualToString:@"PageColor4"])
    {
        self.PageColor4 = [Utils concate:self.PageColor4 :string];
    }
}


@end
