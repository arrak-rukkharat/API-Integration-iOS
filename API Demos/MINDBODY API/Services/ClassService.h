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
 Retrive classes for specific dates.
 @param startDate
 @param endDate
 @param showOnlyEnrollables if YES, the results will respect scheduling window
 */
+ (void)GetClassesFromDate:(NSDate*)startDate toDate:(NSDate*)endDate showOnlyEnrollables:(BOOL)enrollable withBlock:(void (^)(ClassesResult* result))block;

/*!
 Retrive classes with custom filters.
 @param classIDs
 @param staffIDs
 @param startDateTime
 @param endDateTime
 @param clientID
 @param serviceCategoryIDs
 @param sessionTypeIDs
 @param locationIDs
 @param showOnlyEnrollables if YES, the results will respect scheduling window
 */
+ (void)GetClassesByIDsOrNil:(NSArray*)classIDs byStaffIDsOrNil:(NSArray*)staffIDs byStartDateTimeOrNil:(NSDate*)startDateTime byEndDateTimeOrNil:(NSDate*)endDateTime byClientIDOrNil:(NSString*)clientID byServiceCategoryIDsOrNil:(NSArray*)serviceCategoryIDs bySessionTypeIDsOrNil:(NSArray*)sessionTypeIDs byLocationIDsOrNil:(NSArray*)locationIDs showOnlyEnrollables:(BOOL)enrollable withBlock:(void (^)(ClassesResult* result))block;

/*!
 Sign up a client for a class. This requires user credentials. If it is consumer credentials, client ID can be omited.
 @param clientID Client ID that represents the client
 @param classID Class ID that represents the class
 @param sendEmail if YES, send an email to notify the client
 @param requirePayment if YES, the adding will ignore client payment status
 */
+ (void)AddClient:(NSString*)clientID toClass:(NSString*)classID serviceID:(NSString*)serviceID sendClientEmail:(BOOL)sendEmail withBlock:(void (^)(ClassResult* result))block;

/*!
 Cancel a class in business mode. This requires staff credentials. Staff might need specific permission(s) to complete the action.
 @param classID Class ID that represents the class
 @param sendClientEmail if YES, send an email to notify the clients that have already singed up for this class
 @param sendStaffEmail if YES, send an email to notify the staff that teaches this class
 */
+ (void)CancelClass:(NSString*)classID sendClientEmail:(BOOL)sendClientEmail sendStaffEmail:(BOOL)sendStaffEmail withBlock:(void (^)(ClassResult* result))block;

/*!
 Remove a client from a specified class. This requires user credentials.
 @param clientID Client ID that represents the client
 @param classID Class ID that represents the class
 @param sendClientEmail if YES, send an email to notify the client
 @param lateCancel if YES, the removal becomes a late cancel
 */
+ (void)RemoveClient:(NSString*)clientID fromClass:(NSString*)classID sendClientEmail:(BOOL)sendClientEmail markAsLateCancel:(BOOL)lateCancel withBlock:(void (^)(ClassResult* result))block;

/*!
 Get class schedules with custom filters.
 @param classScheduleIDs
 @param staffIDs
 @param startDateTime
 @param endDateTime
 @param serviceCategoryIDs
 @param sessionTypeIDs
 @param locationIDs
 */
+ (void)GetClassScheduleByIDOrNil:(NSArray*)classScheduleIDs byStaffIDsOrNil:(NSArray*)staffIDs byStartDateTimeOrNil:(NSDate*)startDateTime byEndDateTimeOrNil:(NSDate*)endDateTime byServiceCategoryIDsOrNil:(NSArray*)serviceCategoryIDs bySessionTypeIDsOrNil:(NSArray*)sessionTypeIDs byLocationIDsOrNil:(NSArray*)locationIDs withBlock:(void (^)(ClassSchedulesResult *result))block;

/*!
 Get visits for a specified class. Commonly used for reports. This requires staff credentials.
 @param classID Class ID that represents the class
 */
+ (void)GetClassVisitsByClassID:(NSString*)classID withBlock:(void (^)(VisitsResult *result))block;

/*!
 Get courses with custom filters.
 @param courseIDs
 @param staffIDs
 @param serviceCategoryIDs
 @param semesterIDs
 @param locationIDs
 @param startDateTime
 @param endDateTime
 */
+ (void)GetCoursesByIDsOrNil:(NSArray*)courseIDs byStaffIDsOrNil:(NSArray*)staffIDs byServiceCategoryIDsOrNil:(NSArray*)serviceCategoryIDs bySemesterIDsOrNil:(NSArray*)semesterIDs byLocationIDsOrNil:(NSArray*)locationIDs fromDateTime:(NSDate*)startDateTime toDateTime:(NSDate*)endDateTime withBlock:(void (^)(CoursesResult *result))block;

/*!
 Get courses for specified dates.
 @param startDate
 @param endDate
 */
+ (void)GetCoursesFromDate:(NSDate*)startDate toDate:(NSDate*)endDate withBlock:(void (^)(CoursesResult *result))block;

/*!
 Get enrollments for specified dates.
 @param startDateTime
 @param endDateTime
 */
+ (void)GetEnrollmentsFromDate:(NSDate*)startDateTime toDate:(NSDate*)endDateTime withBlock:(void (^)(ClassSchedulesResult *result))block;

/*!
 Get waitlist entries with custom filters. This requires user credentials.
 @param classID
 @param entryID
 @param classScheduleID
 @param clientID
 @param hidePastEntries
 */
+ (void)GetWaitlistByClassIDOrNil:(NSString*)classID byEntryIDOrNil:(NSString*)entryID byClassScheduleIDOrNil:(NSString*)classScheduleID byClientIDOrNil:(NSString*)clientID hidePastEntries:(NSString*)hidePastEntries withBlock:(void (^)(WaitlistEntriesResult *result))block;

/*!
 Get enrollment waitlist entries. This requires user credentials.
 @param classScheduleID
 @param hidePastEntries
 */
+ (void)GetWaitlistByClassScheduleID:(NSString*)classScheduleID hidePastEntries:(NSString*)hidePastEntries withBlock:(void (^)(WaitlistEntriesResult *result))block;

/*!
 Get class waitlist entries. This requires user credentials.
 @param classID
 @param hidePastEntries
 */
+ (void)GetWaitlistByClassID:(NSString*)classID hidePastEntries:(NSString*)hidePastEntries withBlock:(void (^)(WaitlistEntriesResult *result))block;

/*!
 Get waitlist entries for specific client. This requires user credentials.
 @param clientID
 @param hidePastEntries
 */
+ (void)GetWaitlistByClientID:(NSString*)clientID hidePastEntries:(NSString*)hidePastEntries withBlock:(void (^)(WaitlistEntriesResult *result))block;
@end
