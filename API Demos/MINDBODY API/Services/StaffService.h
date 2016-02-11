//
//  StaffService.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/23/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLStaffService.h"
#import "MBResponseObjects.h"

/*!
 Contains a group of methods that are mainly responsible for 
 adding and updating staff and their information including the basic information and permissions.
 */
@interface StaffService : NSObject

/*!
 Add staff to the studio.
 */
+ (void)AddStaff:(Staff*)staff withBlock:(void (^)(StaffMemberResult* result))block;

/*!
 Update staff information based on the staff ID
 */
+ (void)UpdateStaff:(Staff*)staff staffID:(NSString*)ID withBlock:(void (^)(StaffMemberResult* result))block;

/*!
 Retrive the list of all staff members in the studio
 */
+ (void)GetAllStaffWithBlock:(void (^)(StaffMembersResult* result))block;

/*!
 Retrive the list of staff members based on the given staff IDs
 @param staffIDs list of NSString
 */
+ (void)GetStaffWithStaffIDs:(NSArray*)staffIDs WithBlock:(void (^)(StaffMembersResult* result))block;

/*!
 Validate a staff member credentials against the studio log in
 @param username username to log in
 @param password password coresponding to the username
 */
+ (void)ValidateStaffLoginWithUsername:(NSString*)username password:(NSString*)password withBlock:(void (^)(StaffMemberResult* result))block;
@end




