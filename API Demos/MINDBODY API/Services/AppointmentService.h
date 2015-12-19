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
 @param staffID
 @param startDate
 @param endDate
 */
+ (void) GetAppointmentsForStaffID:(NSString*)staffID fromDate:(NSDate*)startDate toDate:(NSDate*)endDate withBlock:(void (^)(AppointmentsResult *result))block;

/*!
 Retrive the booked appointment by ID, in business mode. This requires a staff credentials.
 @param appointmentID
 */
+ (void) GetAppointmentByID:(NSString*)appointmentID withBlock:(void (^)(AppointmentsResult *result))block;

/*!
 Retrive booked staff appointments in business mode. This requires a staff credentials.
 @param appointmentID
 @param staffID
 @param clientID
 @param locationID
 @param startDate
 @param endDate
 */
+ (void)GetAppointmentsByIDOrNil:(NSString*)appointmentID staffIDOrNil:(NSString*)staffID clientIDOrNil:(NSString*)clientID locationIDOrNil:(NSString*)locationID startDateOrNil:(NSDate*)startDate endDateOrNil:(NSDate*)endDate withBlock:(void (^)(AppointmentsResult *result))block;

/*!
 For business mode, update the booked appointment for the given appointment ID. This requires a staff credentials.
 @param appointmentID
 @param staffID - the trainer
 @param startTime - appointment's start time
 @param notes
 @param sendEmail - notify the client via email
 */
+ (void)UpdateAppointmentForID:(NSString*)appointmentID staffIDOrNil:(NSString*)staffID startDateTimeOrNil:(NSDate*)startTime notesOrNil:(NSString*)notes sendEmail:(BOOL)sendEmail withBlock:(void (^)(AppointmentResult *result))block;

/*!
 For business mode, update the appointment's start time for the given appointment ID. This requires a staff credentials.
 @param startTime - appointment's start time
 @param appointmentID
 @param sendEmail - notify the client via email
 */
+ (void)UpdateAppointmentStartDateTime:(NSDate*)startTime forAppointmentID:(NSString*)appointmentID sendEmail:(BOOL)sendEmail withBlock:(void (^)(AppointmentResult *result))block;

/*!
 For business mode, update the appointment's trainer for the given appointment ID. This requires a staff credentials.
 @param staffID - the trainer
 @param appointmentID
 @param sendEmail - notify the client via email
 */
+ (void)UpdateAppointmentStaff:(NSString*)staffID forAppointmentID:(NSString*)appointmentID sendEmail:(BOOL)sendEmail withBlock:(void (^)(AppointmentResult *result))block;

/*!
 For business mode, update the appointment's trainer for the given appointment ID. This requires a staff credentials.
 @param notes
 @param appointmentID
 */
+ (void)UpdateAppointmentNotes:(NSString*)notes forAppointmentID:(NSString*)appointmentID withBlock:(void (^)(AppointmentResult *result))block;


/*!
 Book a given client with the given staff
 @param staffID - the trainer for the appointment
 @param clientID - the client of this appointment
 @param locationID - the location the appointment takes place
 @param serviceID - the service to pay for this booking. The service will be comsumed.
 @param sessionTypeID - the sessiontype that represents the length of the appointment.
 @param startDate - the start date time
 @param notes - the notes
 @param snedEmail - If YES, notify the client via email
 */
+ (void)BookNewAppointmentForStaffID:(NSString*)staffID withClientID:(NSString*)clientID atLocationID:(NSString*)locationID payWithService:(NSString*)serviceID lengthBySessionTypeID:(NSString*)sessionTypeID startDateTime:(NSDate*)startTime notesOrNil:(NSString*)notes sendEmail:(BOOL)sendEmail withBlock:(void (^)(AppointmentResult *result))block;


/*!
 Get bookable time slots for appointment booking for the specific type of session.
 @param staffID - filter the result by staff
 @param locationID - filter the result by location
 @param startDate - filter the result by start date
 @param endDate - filter the result by end date
 @param ignoreDefaultSessionLength - If YES, the result is not filtered by the default time length
 */
+ (void)GetBookables:(NSString*)apptID staffID:(NSString*)staffID sessionTypeIDs:(NSMutableArray*)sessionTypeIDs locationID:(NSString*)locationID startDate:(NSDate*)start endDate:(NSDate*)end ignoreDefaultSessionLength:(BOOL)ignoreDefaultSessionLength withBlock:(void (^)(ScheduleItemsResult *result))block;

/*!
 Get bookable time slots for appointment booking for all staff and all locations for the given session types.
 @param startDate - filter the result by start date
 @param endDate - filter the result by end date
 */
+ (void)GetBookablesBySessionTypeIDs:(NSMutableArray*)sessionTypeIDs startDate:(NSDate*)start endDate:(NSDate*)end withBlock:(void (^)(ScheduleItemsResult *result))block;


@end
