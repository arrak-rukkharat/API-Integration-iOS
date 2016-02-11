//
//  StaffService.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/23/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "StaffService.h"

@implementation StaffService

+ (void)AddStaff:(Staff*)staff withBlock:(void (^)(StaffMemberResult* result))block;
{
    NSURLRequest *request = [XMLStaffService SOAPAddStaff:staff];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          StaffMemberResult *result = [StaffMemberResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetAllStaffWithBlock:(void (^)(StaffMembersResult* result))block
{
    NSURLRequest *request = [XMLStaffService SOAPGetStaff:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          StaffMembersResult *result = [StaffMembersResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetStaffWithStaffIDs:(NSArray*)staffIDs WithBlock:(void (^)(StaffMembersResult* result))block
{
    NSURLRequest *request = [XMLStaffService SOAPGetStaff:staffIDs];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          StaffMembersResult *result = [StaffMembersResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)UpdateStaff:(Staff*)staff staffID:(NSString*)ID withBlock:(void (^)(StaffMemberResult* result))block;
{
    NSURLRequest *request = [XMLStaffService SOAPUpdateStaff:staff by:ID];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        StaffMemberResult *result = [StaffMemberResult new];
        [result mapData:data];
        block(result);
        
    }] resume];
}

+ (void)GetStaffPermissions:(NSString*)staffID withBlock:(void (^)(StaffPermissionsResult* result))block;
{
    NSURLRequest *request = [XMLStaffService SOAPGetStaffPermissions:staffID];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        StaffPermissionsResult *result = [StaffPermissionsResult new];
        [result mapData:data];
        block(result);
    }] resume];
}

+ (void)ValidateStaffLoginWithUsername:(NSString*)username password:(NSString*)password withBlock:(void (^)(StaffMemberResult* result))block;
{
    NSURLRequest *request = [XMLStaffService SOAPValidateStaffLoginWithUsername:username password:password];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          StaffMemberResult *result = [StaffMemberResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

@end
