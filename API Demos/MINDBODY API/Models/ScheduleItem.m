//
//  ScheduleItem.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 11/3/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ScheduleItem.h"

@implementation ScheduleItem
- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"StartDateTime"])
    {
        startTime = [Utils concate:startTime :string];
    }
    else if ([element isEqualToString:@"EndDateTime"])
    {
        endTime = [Utils concate:endTime :string];
    }
    else if ([element isEqualToString:@"EndDateTime"])
    {
        bookableEndTime = [Utils concate:bookableEndTime :string];
    }
}

- (void)finish
{
    self.BookableEndDateTime = [Utils convertISOToDate:bookableEndTime];
    self.StartDateTime = [Utils convertISOToDate:startTime];
    self.EndDateTime = [Utils convertISOToDate:endTime];
}
@end
