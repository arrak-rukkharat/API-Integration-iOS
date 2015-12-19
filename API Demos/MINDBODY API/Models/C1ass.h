//
//  Class.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 9/25/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"
#import "ClassDescription.h"
#import "Staff.h"
#import "Client.h"
/*!
 @brief Represents a single unique class 
 */
@interface C1ass : DataMapper
{
    NSString *startDateString, *endDateString;
}

/// Class schedule ID
@property (nonatomic, strong) NSString *ClassScheduleID;
/// ID
@property (nonatomic, strong) NSString *ID;
/// Maximum capacity for this class
@property (nonatomic, assign) int MaxCapacity;
/// Online maximum capacity for this class
@property (nonatomic, assign) int WebCapacity;
/// Total signed up
@property (nonatomic, assign) int TotalBooked;
/// Total waitlist signed up
@property (nonatomic, assign) int TotalBookedWaitlist;
/// Total web signed up
@property (nonatomic, assign) int WebBooked;
/// Semester ID
@property (nonatomic, strong) NSString *SemesterID;
/// Cancel status
@property (nonatomic, assign) BOOL IsCanceled;
/// Substitute status
@property (nonatomic, assign) BOOL Substitute;
/// Active status
@property (nonatomic, assign) BOOL Active;
/// Waitlist availability status
@property (nonatomic, assign) BOOL IsWaitlistAvailable;
/// Enrollment status
@property (nonatomic, assign) BOOL IsEnrolled;
/// Visibility status after canceled
@property (nonatomic, assign) BOOL HideCancel;
/// Availability status
@property (nonatomic, assign) BOOL IsAvailable;
/// Start time (site time)
@property (nonatomic, strong) NSDate *StartDateTime;
/// End time (site time)
@property (nonatomic, strong) NSDate *EndDateTime;
/// Location that the class takes place
@property (nonatomic, strong) Location *Location;
/// Description
@property (nonatomic, strong) ClassDescription *ClassDescription;
/// Staff/Trainer
@property (nonatomic, strong) Staff *Staff;
/// Client
@property (nonatomic, strong) Client *Client;


@end
