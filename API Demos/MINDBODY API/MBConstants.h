//
//  MBConstants.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/24/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef MBSOAP_MBConstants_h
#define MBSOAP_MBConstants_h

// API Endpoints
#define ENDPOINT_STAFF @"https://api.mindbodyonline.com/0_5/StaffService.asmx"
#define ENDPOINT_CLIENT @"https://api.mindbodyonline.com/0_5/ClientService.asmx"
#define ENDPOINT_SITE @"https://api.mindbodyonline.com/0_5/SiteService.asmx"
#define ENDPOINT_SALE @"https://api.mindbodyonline.com/0_5/SaleService.asmx"
#define ENDPOINT_CLASS @"https://api.mindbodyonline.com/0_5/ClassService.asmx"
#define ENDPOINT_APPT @"https://api.mindbodyonline.com/0_5/AppointmentService.asmx"

#define CONTENT_TYPE @"text/xml; charset=utf-8"

// SOAP request headers
#define API_ENDPOINT @"http://clients.mindbodyonline.com/api/0_5/%@"


// Error codes
#define CODE_SUCCESS 200

// Specific boolean type
//#define UNSET 5


// User access level
typedef NS_ENUM (NSInteger, UserAccessLevel)
{
    UserAccessLevelNone     = 0,
    UserAccessLevelConsumer = 1,
    UserAccessLevelStaff    = 3,
    UserAccessLevelPartner  = 7,
    UserAccessLevelOwner    = 15,
    UserAccessLevelAdmin    = 31
};

typedef NS_ENUM(NSInteger, DataDetail) {
    DataDetailFull,
    DataDetailBare,
    DataDetailBasic
};

#define SCH_TYPE_ALL @"All"
#define SCH_TYPE_CLASS @"DropIn"
#define SCH_TYPE_APPOINTMENT @"Appointment"


#endif
