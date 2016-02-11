//
//  ClassService.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 9/25/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClassService.h"

@implementation ClassService

+ (void)GetClassesForTodayWithBlock:(void (^)(ClassesResult* result))block
{
    NSURLRequest *request = [XMLClassService SOAPGetClasses:nil staffIDs:nil startDateTime:nil endDateTime:nil clientID:nil serviceCategoryIDs:nil sessionTypeIDs:nil locationIDs:nil schedulingWindow:YES];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClassesResult *result = [ClassesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClassesBetweenDate:(NSDate*)startDate andDate:(NSDate*)endDate withinSchedulingWindow:(BOOL)enrollable withBlock:(void (^)(ClassesResult* result))block
{
    NSURLRequest *request = [XMLClassService SOAPGetClasses:nil staffIDs:nil startDateTime:startDate endDateTime:endDate clientID:nil serviceCategoryIDs:nil sessionTypeIDs:nil locationIDs:nil schedulingWindow:enrollable];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClassesResult *result = [ClassesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClassesByIDsOrNil:(NSArray*)classIDs byStaffIDsOrNil:(NSArray*)staffIDs byStartDateTimeOrNil:(NSDate*)startDateTime byEndDateTimeOrNil:(NSDate*)endDateTime byClientIDOrNil:(NSString*)clientID byServiceCategoryIDsOrNil:(NSArray*)serviceCategoryIDs bySessionTypeIDsOrNil:(NSArray*)sessionTypeIDs byLocationIDsOrNil:(NSArray*)locationIDs showOnlyEnrollables:(BOOL)enrollable withBlock:(void (^)(ClassesResult* result))block
{
    NSURLRequest *request = [XMLClassService SOAPGetClasses:classIDs staffIDs:staffIDs startDateTime:startDateTime endDateTime:endDateTime clientID:clientID serviceCategoryIDs:serviceCategoryIDs sessionTypeIDs:sessionTypeIDs locationIDs:locationIDs schedulingWindow:enrollable];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClassesResult *result = [ClassesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

// Business mode
+ (void)AddClientFree:(NSString*)clientID toClass:(NSString*)classID sendClientEmail:(BOOL)sendEmail withBlock:(void (^)(ClassResult* result))block
{
    NSURLRequest *request = [XMLClassService SOAPAddClientToClass:classID clientID:clientID waitlist:false sendEmail:sendEmail requirePayment:NO serviceID:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClassResult *result = [ClassResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)AddClientToClassWithClientID:(NSString*)clientID classID:(NSString*)classID serviceID:(NSString*)serviceID sendClientEmail:(BOOL)sendEmail withBlock:(void (^)(ClassResult* result))block
{
    NSURLRequest *request = [XMLClassService SOAPAddClientToClass:classID clientID:clientID waitlist:false sendEmail:sendEmail requirePayment:YES serviceID:serviceID];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClassResult *result = [ClassResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)CancelClassWithClassID:(NSString*)classID sendClientsEmail:(BOOL)sendClientEmail sendStaffEmail:(BOOL)sendStaffEmail withBlock:(void (^)(ClassResult* result))block
{
    NSURLRequest *request = [XMLClassService SOAPCancelClass:classID sendClientEmail:sendClientEmail sendStaffEmail:sendStaffEmail];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClassResult *result = [ClassResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)RemoveClientFromClassWithClientID:(NSString*)clientID classID:(NSString*)classID sendClientEmail:(BOOL)sendClientEmail markAsLateCancel:(BOOL)lateCancel withBlock:(void (^)(ClassResult* result))block
{
    NSURLRequest *request = [XMLClassService SOAPDropClient:clientID fromClass:classID sendClientEmail:sendClientEmail lateCancel:lateCancel];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClassResult *result = [ClassResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClassScheduleByIDOrNil:(NSArray*)classScheduleIDs byStaffIDsOrNil:(NSArray*)staffIDs byStartDateTimeOrNil:(NSDate*)startDateTime byEndDateTimeOrNil:(NSDate*)endDateTime byServiceCategoryIDsOrNil:(NSArray*)serviceCategoryIDs bySessionTypeIDsOrNil:(NSArray*)sessionTypeIDs byLocationIDsOrNil:(NSArray*)locationIDs withBlock:(void (^)(ClassSchedulesResult *result))block
{
    NSURLRequest *request = [XMLClassService SOAPGetClassSchedule:classScheduleIDs staffIDs:staffIDs startDateTime:startDateTime endDateTime:endDateTime serviceCategoryIDs:serviceCategoryIDs sessionTypeIDs:sessionTypeIDs locationIDs:locationIDs];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClassSchedulesResult *result = [ClassSchedulesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClassVisitsByClassID:(NSString*)classID withBlock:(void (^)(VisitsResult *result))block
{
    NSURLRequest *request = [XMLClassService SOAPGetClassVisits:classID];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          VisitsResult *result = [VisitsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetCoursesByIDsOrNil:(NSArray*)courseIDs byStaffIDsOrNil:(NSArray*)staffIDs byServiceCategoryIDsOrNil:(NSArray*)serviceCategoryIDs bySemesterIDsOrNil:(NSArray*)semesterIDs byLocationIDsOrNil:(NSArray*)locationIDs fromDateTime:(NSDate*)startDateTime toDateTime:(NSDate*)endDateTime withBlock:(void (^)(CoursesResult *result))block
{
    NSURLRequest *request = [XMLClassService SOAPGetCourses:courseIDs staffIDs:staffIDs startDateTime:startDateTime endDateTime:endDateTime serviceCategoryIDs:serviceCategoryIDs semesterIDs:semesterIDs locationIDs:locationIDs];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          CoursesResult *result = [CoursesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetCoursesBetweenDates:(NSDate*)startDate andDate:(NSDate*)endDate withBlock:(void (^)(CoursesResult *result))block
{
    NSURLRequest *request = [XMLClassService SOAPGetCourses:nil staffIDs:nil startDateTime:startDate endDateTime:endDate serviceCategoryIDs:nil semesterIDs:nil locationIDs:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          CoursesResult *result = [CoursesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetEnrollmentsBetweenDates:(NSDate*)startDateTime andDate:(NSDate*)endDateTime withBlock:(void (^)(ClassSchedulesResult *result))block
{
    NSURLRequest *request = [XMLClassService SOAPGetEnrollments:nil staffIDs:nil startDateTime:startDateTime endDateTime:endDateTime serviceCategoryIDs:nil semesterIDs:nil locationIDs:nil sessionTypeIDs:nil classScheduleIDs:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClassSchedulesResult *result = [ClassSchedulesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetEnrollmentsByCourseIDsOrNil:(NSArray*)courseIDs byStaffIDsOrNil:(NSArray*)staffIDs byServiceCategoryIDsOrNil:(NSArray*)serviceCategoryIDs bySemesterIDsOrNil:(NSArray*)semesterIDs byLocationIDsOrNil:(NSArray*)locationIDs bySessionTypeIDsOrNil:(NSArray*)sessionTypeIDs byClassScheduleIDsOrNil:(NSArray*)classScheduleIDs byStartDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime withBlock:(void (^)(ClassSchedulesResult *result))block
{
    NSURLRequest *request = [XMLClassService SOAPGetEnrollments:courseIDs staffIDs:staffIDs startDateTime:startDateTime endDateTime:endDateTime serviceCategoryIDs:serviceCategoryIDs semesterIDs:semesterIDs locationIDs:locationIDs sessionTypeIDs:semesterIDs classScheduleIDs:classScheduleIDs];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClassSchedulesResult *result = [ClassSchedulesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetWaitlistByClassIDOrNil:(NSString*)classID byEntryIDOrNil:(NSString*)entryID byClassScheduleIDOrNil:(NSString*)classScheduleID byClientIDOrNil:(NSString*)clientID hidePastEntries:(NSString*)hidePastEntries withBlock:(void (^)(WaitlistEntriesResult *result))block
{
    NSURLRequest *request = [XMLClassService SOAPGetWaitlistByClassID:classID byEntryID:entryID byClassScheduleID:classScheduleID byClientID:clientID hidePastEntries:hidePastEntries];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          WaitlistEntriesResult *result = [WaitlistEntriesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClassWaitlistWithClassScheduleID:(NSString*)classScheduleID hidePastEntries:(NSString*)hidePastEntries withBlock:(void (^)(WaitlistEntriesResult *result))block
{
    NSURLRequest *request = [XMLClassService SOAPGetWaitlistByClassID:nil byEntryID:nil byClassScheduleID:classScheduleID byClientID:nil hidePastEntries:hidePastEntries];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          WaitlistEntriesResult *result = [WaitlistEntriesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}


+ (void)GetClassWaitlistWithClassID:(NSString*)classID hidePastEntries:(NSString*)hidePastEntries withBlock:(void (^)(WaitlistEntriesResult *result))block
{
    NSURLRequest *request = [XMLClassService SOAPGetWaitlistByClassID:classID byEntryID:nil byClassScheduleID:nil byClientID:nil hidePastEntries:hidePastEntries];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          WaitlistEntriesResult *result = [WaitlistEntriesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClassWaitlistWithClientID:(NSString*)clientID hidePastEntries:(NSString*)hidePastEntries withBlock:(void (^)(WaitlistEntriesResult *result))block
{
    NSURLRequest *request = [XMLClassService SOAPGetWaitlistByClassID:nil byEntryID:nil byClassScheduleID:nil byClientID:clientID hidePastEntries:hidePastEntries];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          WaitlistEntriesResult *result = [WaitlistEntriesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}



@end
