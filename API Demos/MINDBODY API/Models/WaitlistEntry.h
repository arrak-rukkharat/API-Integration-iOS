//
//  WaitlistEntry.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/21/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "DataMapper.h"
#import "Client.h"
#import "ClassSchedule.h"
/*!
 @brief Represents a waitlist item for class/enrollment
 */
@interface WaitlistEntry : DataMapper
{
    NSString *classDateStr, *enrollDateStr, *requestDateStr;
}

/// Class cchedule ID
@property (nonatomic, strong) NSString *ClassScheduleID;
/// ID of the waitlist entry.
@property (nonatomic, strong) NSString *ID;
/// ID of the Class or Enrollment
@property (nonatomic, strong) NSString *ClassID;
/// Visit associated with the entry
@property (nonatomic, strong) NSString *VisitRefNo;
/// If waitlist was requested from the web.
@property (nonatomic, assign) BOOL Web;
/// Date of the Class or Enrollment (site time)
@property (nonatomic, strong) NSDate *ClassDate;
/// Date forward requested for enrollment.
@property (nonatomic, strong) NSDate *EnrollmentDateForward;
/// Date and time request made.
@property (nonatomic, strong) NSDate *RequestDateTime;
/// Class schedule of the waitlist entry.
@property (nonatomic, strong) ClassSchedule *ClassSchedule;
/// Client
@property (nonatomic, strong) Client *Client;

@end
