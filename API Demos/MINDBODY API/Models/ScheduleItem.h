//
//  ScheduleItem.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 11/3/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "DataMapper.h"
#import "Location.h"
#import "Staff.h"
#import "SessionType.h"

/*!
 @brief Represents a schedule item, availability, or unavailability
 */
@interface ScheduleItem : DataMapper
{
    NSString *startTime;
    NSString *endTime;
    NSString *bookableEndTime;
}
/// The unique ID
@property(nonatomic, strong) NSString *ID;
///
@property(nonatomic, strong) NSDate *BookableEndDateTime;
/// Start time
@property(nonatomic, strong) NSDate *StartDateTime;
/// End time.
@property(nonatomic, strong) NSDate *EndDateTime;
/// Staff, teacher, or trainer
@property(nonatomic, strong) Staff *Staff;
/// The location of the schedule
@property(nonatomic, strong) Location *Location;
/// The session type of the schedule
@property(nonatomic, strong) SessionType *SessionType;

@end
