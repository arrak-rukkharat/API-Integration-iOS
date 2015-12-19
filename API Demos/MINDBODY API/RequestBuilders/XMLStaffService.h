//
//  SOAPWraper.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/23/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//
//  Static Wrapper for SOAP API
#include "MBConstants.h"
#import "SourceCredentials.h"
#import "UserCredentials.h"
#import "Staff.h"

#import <Foundation/Foundation.h>

@interface XMLStaffService : NSObject

+ (NSURLRequest*) SOAPGetStaff:(NSArray*)staffIDs;
+ (NSURLRequest*)SOAPAddStaff:(Staff*)staff;
+ (NSURLRequest*)SOAPUpdateStaff:(Staff*)staff by:(NSString*)ID;
+ (NSURLRequest*)SOAPGetStaffPermissions:(NSString*)staffID;
+ (NSURLRequest*)SOAPValidateStaffLoginWithUsername:(NSString*)username password:(NSString*)password;
@end
