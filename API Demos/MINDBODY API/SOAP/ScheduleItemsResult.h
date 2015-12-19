//
//  ScheduleItemsResult.h
//  MBAPI
//
//  Created by Blackbolt on 11/12/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface ScheduleItemsResult : MBResult
{
    NSMutableArray *array;
    ScheduleItem *item;
    SessionType *sess;
    Location *loc;
    Staff *staff;
}

/// Collection of <ScheduleItem>
@property (nonatomic, strong) NSArray *ScheduleItems;
@end
