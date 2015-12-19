//
//  self.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/22/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "CartItem.h"

@implementation CartItem

- (id)init
{
    if (self = [super init])
    {
        self.Appointments = [NSMutableArray new];
        self.EnrollmentIDs = [NSMutableArray new];
        self.ClassIDs = [NSMutableArray new];
        self.CourseIDs = [NSMutableArray new];
        self.VisitIDs = [NSMutableArray new];
        self.AppointmentIDs = [NSMutableArray new];
    }
    return self;
}

- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"DiscountAmount"])
    {
        self.DiscountAmount = [Utils concate:self.DiscountAmount :string];
    }
    else if ([element isEqualToString:@"Quantity"])
    {
        self.Quantity = [string intValue];
    }
}

- (void)finish
{
    
}

@end