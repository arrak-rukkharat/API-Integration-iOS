//
//  Visit.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/4/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"
#import "Staff.h"
#import "Service.h"
#import "Client.h"
/*!
 @brief Represents a visit with the specified times and related information
 */
@interface Visit : DataMapper
{
    NSString *startTime;
    NSString *endTime;
}
/// The unique visit ID
@property(nonatomic, strong) NSString *ID;
/// The class ID. The visit is a class if ClassID is non-zero.
@property(nonatomic, strong) NSString *ClassID;
/// The appointment ID. The visit is an appointment if AppointmentID is non-zero.
@property(nonatomic, strong) NSString *AppointmentID;
/// Start time of the visit.
@property(nonatomic, strong) NSDate *StartDateTime;
/// End time of the visit.
@property(nonatomic, strong) NSDate *EndDateTime;
/// Determine if the visit is late cancelled.
@property(nonatomic, assign) BOOL LateCancelled;
/// Determine if the visit is web signed up.
@property(nonatomic, assign) BOOL WebSignup;
/// Signed in status.
@property(nonatomic, assign) BOOL SignedIn;
/// Determine if the visit is a makeup visit.
@property(nonatomic, assign) BOOL MakeUp;
/// Name of the visit
@property(nonatomic, strong) NSString *Name;
/// Staff, teacher, or trainer for the visit
@property(nonatomic, strong) Staff *Staff;
/// The location
@property(nonatomic, strong) Location *Location;
/// Service used to pay for this visit
@property(nonatomic, strong) Service *Service;
/// Client who attended this
@property(nonatomic, strong) Client *Client;

@end
