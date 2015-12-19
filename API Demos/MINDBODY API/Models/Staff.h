//
//  Staff.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 7/23/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//
#import <Foundation/Foundation.h>
#include "MBConstants.h"
#import "DataMapper.h"
/*!
 @brief Represents a staff member with information and statuses
 */
@interface Staff : DataMapper

/// First name
@property (strong, nonatomic) NSString *FirstName;
/// Last name
@property (strong, nonatomic) NSString *LastName;
/// Full name
@property (strong, nonatomic) NSString *Name;
/// Email address
@property (strong, nonatomic) NSString *Email;
/// Mobile phone
@property (strong, nonatomic) NSString *MobilePhone;
/// Home phone
@property (strong, nonatomic) NSString *HomePhone;
/// Work phone
@property (strong, nonatomic) NSString *WorkPhone;
/// Address
@property (strong, nonatomic) NSString *Address;
/// Additional address information
@property (strong, nonatomic) NSString *Address2;
/// City
@property (strong, nonatomic) NSString *City;
/// State
@property (strong, nonatomic) NSString *State;
/// Country
@property (strong, nonatomic) NSString *Country;
/// Postal code / zip code
@property (strong, nonatomic) NSString *PostalCode;
/// Zip code
@property (strong, nonatomic) NSString *ForeignZip;
/// Biographic information about the staff
@property (strong, nonatomic) NSString *Bio;
/// ID (Readonly). This value can be replaced with NewID via the UpdateStaff function
@property (strong, nonatomic) NSString *ID;
/// URL for the staff's image in the profile (Readonly)
@property (strong, nonatomic) NSString *ImageURL;
/// Appointment staff status (Readonly)
@property (assign, nonatomic) BOOL AppointmentTrn;
/// Independent contractor status (Readonly)
@property (assign, nonatomic) BOOL IndependentContractor;
/// Overlap booking status (Readonly)
@property (assign, nonatomic) BOOL AlwaysAllowDoubleBooking;
/// Class teacher status (Readonly)
@property (assign, nonatomic) BOOL ReservationTrn;
/*
/// Determine if the value is specified
@property (assign, nonatomic) BOOL AppointmentTrnSpecified;
/// Determine if the value is specified
@property (assign, nonatomic) BOOL IndependentContractorSpecified;
/// Determine if the value is specified
@property (assign, nonatomic) BOOL AlwaysAllowDoubleBookingSpecified;
/// Determine if the value is specified
@property (assign, nonatomic) BOOL ReservationTrnSpecified;
*/
/// Male/Female
@property (assign, nonatomic) BOOL isMale;
// Collection of Location that this staff can log in (Readonly)
@property (nonatomic, strong) NSArray *LoginLocations;
// The access level of this staff. Usually it represents who the staff is. This value is only set when using ValidateStaffLogin
@property (nonatomic, assign) UserAccessLevel AccessLevel;
@end
