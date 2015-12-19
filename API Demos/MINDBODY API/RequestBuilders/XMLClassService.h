//
//  XMLClassService.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 9/4/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "MBConstants.h"
#import "SourceCredentials.h"
#import "UserCredentials.h"
#import "Client.h"
#import "Utils.h"

@interface XMLClassService : NSObject

+ (NSURLRequest*)SOAPGetClasses:(NSArray*)classIDs staffIDs:(NSArray*)staffIDs startDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime clientID:(NSString*)clientID serviceCategoryIDs:(NSArray*)programIDs sessionTypeIDs:(NSArray*)sessionTypeIDs locationIDs:(NSArray*)locationIDs schedulingWindow:(BOOL)schedulingWindow;

+ (NSURLRequest*)SOAPAddClientToClass:(NSString*)classID clientID:(NSString*)clientID waitlist:(BOOL)waitlist sendEmail:(BOOL)sendEmail requirePayment:(BOOL)requirePayment serviceID:(NSString*)serviceID;


+ (NSURLRequest*)SOAPGetClassSchedule:(NSArray*)classScheduleIDs staffIDs:(NSArray*)staffIDs startDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime serviceCategoryIDs:(NSArray*)programIDs sessionTypeIDs:(NSArray*)sessionTypeIDs locationIDs:(NSArray*)locationIDs;

+ (NSURLRequest*)SOAPGetClassVisits:(NSString*)classID;

+ (NSURLRequest*)SOAPGetCourses:(NSArray*)courseIDs staffIDs:(NSArray*)staffIDs startDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime serviceCategoryIDs:(NSArray*)programIDs semesterIDs:(NSArray*)semesterIDs locationIDs:(NSArray*)locationIDs;

+ (NSURLRequest*)SOAPGetEnrollments:(NSArray*)courseIDs staffIDs:(NSArray*)staffIDs startDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime serviceCategoryIDs:(NSArray*)programIDs semesterIDs:(NSArray*)semesterIDs locationIDs:(NSArray*)locationIDs sessionTypeIDs:(NSArray*)sessionTypeIDs classScheduleIDs:(NSArray*)classScheduleIDs;

+ (NSURLRequest*)SOAPGetSemesters:(NSArray*)semesterIDs;


+ (NSURLRequest*)SOAPCancelClass:(NSString*)classID sendClientEmail:(BOOL)sendClientEmail sendStaffEmail:(BOOL)sendStaffEmail;


+ (NSURLRequest*)SOAPDropClient:(NSString*)clientID fromClass:(NSString*)classID sendClientEmail:(BOOL)sendClientEmail lateCancel:(BOOL)lateCancel;

+ (NSURLRequest*)SOAPRemoveFromWaitlist:(NSString*)entryID;

+ (NSURLRequest*)SOAPGetWaitlistByClassID:(NSString*)classID byEntryID:(NSString*)entryID byClassScheduleID:(NSString*)classScheduleID byClientID:(NSString*)clientID hidePastEntries:(NSString*)hidePastEntries;


@end
