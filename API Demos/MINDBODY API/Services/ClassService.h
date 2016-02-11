//
//  ClassService.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 9/25/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLClassService.h"
#import "MBResponseObjects.h"

/*!
 Contains a group of methods that are mainly responsible for
 signing up for classes and enrollments, viewing class history, managing class information
 */
@interface ClassService : NSObject

/*!
 Retrive classes that clients can enroll.
 */
+ (void)GetClassesForTodayWithBlock:(void (^)(ClassesResult* result))block;

/*!
 Retrive classes between specified dates.
 */
+ (void)GetClassesBetweenDate:(NSDate*)startDate andDate:(NSDate*)endDate withinSchedulingWindow:(BOOL)enrollable withBlock:(void (^)(ClassesResult* result))block;

/*!
 Sign up a client for a class. This requires user credentials. If it is consumer credentials, client ID can be omited.
 */
+ (void)AddClientToClassWithClientID:(NSString*)clientID classID:(NSString*)classID serviceID:(NSString*)serviceID sendClientEmail:(BOOL)sendEmail withBlock:(void (^)(ClassResult* result))block;

/*!
 Cancel a class in business mode. This requires staff credentials. Staff might need specific permission(s) to complete the action.
 */
+ (void)CancelClassWithClassID:(NSString*)classID sendClientsEmail:(BOOL)sendClientEmail sendStaffEmail:(BOOL)sendStaffEmail withBlock:(void (^)(ClassResult* result))block;

/*!
 Remove a client from a specified class. This requires user credentials.
 */
+ (void)RemoveClientFromClassWithClientID:(NSString*)clientID classID:(NSString*)classID sendClientEmail:(BOOL)sendClientEmail markAsLateCancel:(BOOL)lateCancel withBlock:(void (^)(ClassResult* result))block;

/*!
 Get visits for a specified class. Commonly used for reports. This requires staff credentials.
 */
+ (void)GetClassVisitsByClassID:(NSString*)classID withBlock:(void (^)(VisitsResult *result))block;

/*!
 Get courses for specified dates.
 */
+ (void)GetCoursesBetweenDates:(NSDate*)startDate andDate:(NSDate*)endDate withBlock:(void (^)(CoursesResult *result))block;

/*!
 Get enrollments for specified dates.
 */
+ (void)GetEnrollmentsBetweenDates:(NSDate*)startDateTime andDate:(NSDate*)endDateTime withBlock:(void (^)(ClassSchedulesResult *result))block;

/*!
 Get enrollment waitlist entries. This requires user credentials.
 */
+ (void)GetClassWaitlistWithClassScheduleID:(NSString*)classScheduleID hidePastEntries:(NSString*)hidePastEntries withBlock:(void (^)(WaitlistEntriesResult *result))block;

/*!
 Get class waitlist entries. This requires user credentials.
 */
+ (void)GetClassWaitlistWithClassID:(NSString*)classID hidePastEntries:(NSString*)hidePastEntries withBlock:(void (^)(WaitlistEntriesResult *result))block;

/*!
 Get waitlist entries for specific client. This requires user credentials.
 */
+ (void)GetClassWaitlistWithClientID:(NSString*)clientID hidePastEntries:(NSString*)hidePastEntries withBlock:(void (^)(WaitlistEntriesResult *result))block;
@end
