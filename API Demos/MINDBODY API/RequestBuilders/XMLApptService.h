//
//  XMLAppointmentService.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/28/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "MBConstants.h"
#import "SourceCredentials.h"
#import "UserCredentials.h"
#import "Client.h"
#import "Utils.h"

@interface XMLApptService : NSObject
+ (NSURLRequest*)SOAPGetStaffAppointments:(NSString*)apptID staffID:(NSString*)staffID clientID:(NSString*)clientID locationID:(NSString*)locationID startDate:(NSDate*)start endDate:(NSDate*)end;

+ (NSURLRequest*)SOAPGetBookableItems:(NSString*)apptID staffID:(NSString*)staffID sessionTypeIDs:(NSMutableArray*)sessionTypeIDs locationID:(NSString*)locationID startDate:(NSDate*)start endDate:(NSDate*)end ignoreDefaultSessionLength:(BOOL)ignoreDefaultSessionLength;

+ (NSURLRequest*)SOAPAddOrUpdateAppointments:(NSString*)apptID staffID:(NSString*)staffID clientID:(NSString*)clientID locationID:(NSString*)locationID serviceID:(NSString*)serviceID sessionTypeID:(NSString*)sessionTypeID startDateTime:(NSDate*)startTime isUpdating:(BOOL)isUpdating  notes:(NSString*)notes execute:(NSString*)execute sendEmail:(BOOL)sendEmail;

+ (NSURLRequest*)SOAPAddOrUpdateAvailabilities:(NSString*)availabilityID staffID:(NSString*)staffID locationID:(NSString*)locationID serviceCategoryID:(NSString*)programID startDateTime:(NSDate*)startTime endDateTime:(NSDate*)endTime isUpdating:(BOOL)isUpdating notes:(NSString*)notes execute:(NSString*)execute unavailableDescription:(NSString*)unavailableDescription isUnavailable:(BOOL)isUnavailable publicDisplay:(BOOL)publicDisplay daysOfWeek:(NSArray*)daysOfWeek;
@end
