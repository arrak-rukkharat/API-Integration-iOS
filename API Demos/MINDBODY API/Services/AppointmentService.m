//
//  AppointmentService.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 11/4/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "AppointmentService.h"

@implementation AppointmentService

+ (void) GetStaffAppointmentsWithStaffID:(NSString*)staffID betweenDate:(NSDate*)startDate andDate:(NSDate*)endDate withBlock:(void (^)(AppointmentsResult *result))block
{
    NSURLRequest *request = [XMLApptService SOAPGetStaffAppointments:nil staffID:staffID clientID:nil locationID:nil startDate:startDate endDate:endDate];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          AppointmentsResult *result = [AppointmentsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void) GetAppointmentByID:(NSString*)appointmentID withBlock:(void (^)(AppointmentsResult *result))block
{
    NSURLRequest *request = [XMLApptService SOAPGetStaffAppointments:appointmentID staffID:nil clientID:nil locationID:nil startDate:nil endDate:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          AppointmentsResult *result = [AppointmentsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetAppointmentsByIDOrNil:(NSString*)appointmentID staffIDOrNil:(NSString*)staffID clientIDOrNil:(NSString*)clientID locationIDOrNil:(NSString*)locationID startDateOrNil:(NSDate*)startDate endDateOrNil:(NSDate*)endDate withBlock:(void (^)(AppointmentsResult *result))block
{
    NSURLRequest *request = [XMLApptService SOAPGetStaffAppointments:appointmentID staffID:staffID clientID:clientID locationID:locationID startDate:startDate endDate:endDate];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          AppointmentsResult *result = [AppointmentsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)UpdateAppointmentForID:(NSString*)appointmentID staffIDOrNil:(NSString*)staffID startDateTimeOrNil:(NSDate*)startTime notesOrNil:(NSString*)notes sendEmail:(BOOL)sendEmail withBlock:(void (^)(AppointmentResult *result))block
{
    NSURLRequest *request = [XMLApptService SOAPAddOrUpdateAppointments:appointmentID staffID:staffID clientID:nil locationID:nil serviceID:nil  sessionTypeID:nil startDateTime:startTime isUpdating:YES notes:notes execute:nil sendEmail:sendEmail];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          AppointmentResult *result = [AppointmentResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)UpdateAppointmentStartDateTimeWithID:(NSString*)appointmentID startDateTime:(NSDate*)startTime sendEmail:(BOOL)sendEmail withBlock:(void (^)(AppointmentResult *result))block
{
    NSURLRequest *request = [XMLApptService SOAPAddOrUpdateAppointments:appointmentID staffID:nil clientID:nil locationID:nil serviceID:nil  sessionTypeID:nil startDateTime:startTime isUpdating:YES notes:nil execute:nil sendEmail:sendEmail];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          AppointmentResult *result = [AppointmentResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)UpdateAppointmentTrainerWithAppointmentID:(NSString*)appointmentID staffID:(NSString*)staffID  sendEmail:(BOOL)sendEmail withBlock:(void (^)(AppointmentResult *result))block
{
    NSURLRequest *request = [XMLApptService SOAPAddOrUpdateAppointments:appointmentID staffID:staffID clientID:nil locationID:nil serviceID:nil  sessionTypeID:nil startDateTime:nil isUpdating:YES notes:nil execute:nil sendEmail:sendEmail];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          AppointmentResult *result = [AppointmentResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)UpdateAppointmentNotesWithAppointmentID:(NSString*)appointmentID notes:(NSString*)notes  withBlock:(void (^)(AppointmentResult *result))block
{
    NSURLRequest *request = [XMLApptService SOAPAddOrUpdateAppointments:appointmentID staffID:nil clientID:nil locationID:nil serviceID:nil  sessionTypeID:nil startDateTime:nil isUpdating:YES notes:notes execute:nil sendEmail:NO];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          AppointmentResult *result = [AppointmentResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)BookNewAppointmentWithStaffID:(NSString*)staffID clientID:(NSString*)clientID locationID:(NSString*)locationID payWithService:(NSString*)serviceID lengthBySessionTypeID:(NSString*)sessionTypeID startDateTime:(NSDate*)startTime notesOrNil:(NSString*)notes sendEmail:(BOOL)sendEmail withBlock:(void (^)(AppointmentResult *result))block
{
    NSURLRequest *request = [XMLApptService SOAPAddOrUpdateAppointments:nil staffID:staffID clientID:clientID locationID:locationID serviceID:serviceID sessionTypeID:sessionTypeID startDateTime:startTime isUpdating:YES notes:notes execute:nil sendEmail:sendEmail];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          AppointmentResult *result = [AppointmentResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetBookables:(NSString*)apptID staffID:(NSString*)staffID sessionTypeIDs:(NSMutableArray*)sessionTypeIDs locationID:(NSString*)locationID startDate:(NSDate*)start endDate:(NSDate*)end ignoreDefaultSessionLength:(BOOL)ignoreDefaultSessionLength withBlock:(void (^)(ScheduleItemsResult *result))block
{
    NSURLRequest *request = [XMLApptService SOAPGetBookableItems:nil staffID:staffID sessionTypeIDs:sessionTypeIDs locationID:locationID startDate:start endDate:end ignoreDefaultSessionLength:ignoreDefaultSessionLength];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ScheduleItemsResult *result = [ScheduleItemsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetBookablesBySessionTypeIDs:(NSMutableArray*)sessionTypeIDs startDate:(NSDate*)start endDate:(NSDate*)end withBlock:(void (^)(ScheduleItemsResult *result))block
{
    NSURLRequest *request = [XMLApptService SOAPGetBookableItems:nil staffID:nil sessionTypeIDs:sessionTypeIDs locationID:nil startDate:start endDate:end ignoreDefaultSessionLength:NO];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ScheduleItemsResult *result = [ScheduleItemsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

@end
