//
//  ClassSchedule.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/9/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "DataMapper.h"
#import "Location.h"
#import "ClassDescription.h"
#import "Staff.h"
/*!
 @brief Represents a series of classes
 */
@interface ClassSchedule : DataMapper
{
    NSString *startTime, *endTime, *startDate, *endDate;
}
/// Semester ID
@property (nonatomic, strong) NSString *SemesterID;
/// ID
@property (nonatomic, strong) NSString *ID;
/// Availability status
@property (nonatomic, assign) BOOL IsAvailable;
/// On Sunday
@property (nonatomic, assign) BOOL DaySunday;
/// On Monday
@property (nonatomic, assign) BOOL DayMonday;
/// On Tuesday
@property (nonatomic, assign) BOOL DayTuesday;
/// On Wednesday
@property (nonatomic, assign) BOOL DayWednesday;
/// On Thursday
@property (nonatomic, assign) BOOL DayThursday;
/// On Friday
@property (nonatomic, assign) BOOL DayFriday;
/// On Saturday
@property (nonatomic, assign) BOOL DaySaturday;
/// Allow open enrollment
@property (nonatomic, assign) BOOL AllowOpenEnrollment;
/// Allow date forwrad enrollment
@property (nonatomic, assign) BOOL AllowDateForwardEnrollment;
/// Start time (site time)
@property (nonatomic, strong) NSDate *StartTime;
/// End time (site time)
@property (nonatomic, strong) NSDate *EndTime;
/// Start date (site time)
@property (nonatomic, strong) NSDate *StartDate;
/// End date (site time)
@property (nonatomic, strong) NSDate *EndDate;
/// Location
@property (nonatomic, strong) Location *Location;
/// Class description
@property (nonatomic, strong) ClassDescription *ClassDescription;
/// Staff
@property (nonatomic, strong) Staff *Staff;


@end
