//
//  AppointmentService.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 11/4/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLApptService.h"
#import "MBResponseObjects.h"

/*!
 Contains a group of methods that are mainly responsible for
 booking appointments and updating the appointment information
 */
@interface AppointmentService : NSObject

/*!
 Retrive booked staff appointments in business mode. This requires a staff credentials.
 */
+ (void) GetStaffAppointmentsWithStaffID:(NSString*)staffID betweenDate:(NSDate*)startDate andDate:(NSDate*)endDate withBlock:(void (^)(AppointmentsResult *result))block;

/*!
 Retrive the booked appointment by ID, in business mode. This requires a staff credentials.
 */
+ (void) GetAppointmentByID:(NSString*)appointmentID withBlock:(void (^)(AppointmentsResult *result))block;

/*!
 For business mode, update the booked appointment for the given appointment ID. This requires a staff credentials.
 */
+ (void)UpdateAppointmentForID:(NSString*)appointmentID staffIDOrNil:(NSString*)staffID startDateTimeOrNil:(NSDate*)startTime notesOrNil:(NSString*)notes sendEmail:(BOOL)sendEmail withBlock:(void (^)(AppointmentResult *result))block;

/*!
 For business mode, update the appointment's start time for the given appointment ID. This requires a staff credentials.
 */
+ (void)UpdateAppointmentStartDateTimeWithID:(NSString*)appointmentID startDateTime:(NSDate*)startTime sendEmail:(BOOL)sendEmail withBlock:(void (^)(AppointmentResult *result))block;

/*!
 For business mode, update the appointment's trainer for the given appointment ID. This requires a staff credentials.
 */
+ (void)UpdateAppointmentTrainerWithAppointmentID:(NSString*)appointmentID staffID:(NSString*)staffID  sendEmail:(BOOL)sendEmail withBlock:(void (^)(AppointmentResult *result))block;

/*!
 For business mode, update the appointment's trainer for the given appointment ID. This requires a staff credentials.
 */
+ (void)UpdateAppointmentNotesWithAppointmentID:(NSString*)appointmentID notes:(NSString*)notes  withBlock:(void (^)(AppointmentResult *result))block;

/*!
 Book a given client with the given staff
 */
+ (void)BookNewAppointmentWithStaffID:(NSString*)staffID clientID:(NSString*)clientID locationID:(NSString*)locationID payWithService:(NSString*)serviceID lengthBySessionTypeID:(NSString*)sessionTypeID startDateTime:(NSDate*)startTime notesOrNil:(NSString*)notes sendEmail:(BOOL)sendEmail withBlock:(void (^)(AppointmentResult *result))block;

/*!
 Get bookable time slots for appointment booking for the specific type of session.
 */
+ (void)GetBookables:(NSString*)apptID staffID:(NSString*)staffID sessionTypeIDs:(NSMutableArray*)sessionTypeIDs locationID:(NSString*)locationID startDate:(NSDate*)start endDate:(NSDate*)end ignoreDefaultSessionLength:(BOOL)ignoreDefaultSessionLength withBlock:(void (^)(ScheduleItemsResult *result))block;

/*!
 Get bookable time slots for appointment booking for all staff and all locations for the given session types.
 */
+ (void)GetBookablesBySessionTypeIDs:(NSMutableArray*)sessionTypeIDs startDate:(NSDate*)start endDate:(NSDate*)end withBlock:(void (^)(ScheduleItemsResult *result))block;


@end
