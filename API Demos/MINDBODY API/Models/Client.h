//
//  Client.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/31/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"
#import "ClientCreditCard.h"
#include "MBConstants.h"
#import "DataMapper.h"
/*!
 @brief Represents a client that uses the consumer facing side of the API
 */
@interface Client : DataMapper
{
    NSString *firstAppointmentDateString, *birthDateString;
}

/// First name
@property (strong, nonatomic) NSString *FirstName;
/// Last name
@property (strong, nonatomic) NSString *LastName;
/// Middle name
@property (strong, nonatomic) NSString *MiddleName;
/// Email address
@property (strong, nonatomic) NSString *Email;
/// Mobile phone
@property (strong, nonatomic) NSString *MobilePhone;
/// Home phone
@property (strong, nonatomic) NSString *HomePhone;
/// Work phone
@property (strong, nonatomic) NSString *WorkPhone;
/// Address
@property (strong, nonatomic) NSString *AddressLine1;
/// Additional address information
@property (strong, nonatomic) NSString *AddressLine2;
/// Action result from adding/updating the client or adding client to a class.
@property (strong, nonatomic) NSString *Action;
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
/// Gender
@property (strong, nonatomic) NSString *Gender;
/// Name of the person in the emergency contact info
@property (strong, nonatomic) NSString *EmergencyContactInfoName;
/// Relationship to the client in the emergency contact info
@property (strong, nonatomic) NSString *EmergencyContactInfoRelationship;
/// Phone number of the person in the emergency contact info
@property (strong, nonatomic) NSString *EmergencyContactInfoPhone;
/// Email of the person in the emergency contact info
@property (strong, nonatomic) NSString *EmergencyContactInfoEmail;
/// Work extension
@property (strong, nonatomic) NSString *WorkExtension;
/// Birth date
@property (strong, nonatomic) NSDate *BirthDate;
/// The date of the first appointment
@property (strong, nonatomic) NSDate *FirstAppointmentDate;
/// Name of the referrer
@property (strong, nonatomic) NSString *ReferredBy;
/// Warning message
@property (strong, nonatomic) NSString *YellowAlert;
/// Red alert message
@property (strong, nonatomic) NSString *RedAlert;
/// Username
@property (strong, nonatomic) NSString *Username;
/// Password
@property (strong, nonatomic) NSString *Password;
/// Client notes
@property (strong, nonatomic) NSString *Notes;
/// ID (Readonly)
@property (strong, nonatomic) NSString *ID;
/// Prefered gender for the appointment trainer
@property (strong, nonatomic) NSString *AppointmentGenderPreference;
/// URL for the client's image in the profile (Readonly)
@property (strong, nonatomic) NSString *PhotoURL;
/// Determine if the client is company
@property (assign, nonatomic) BOOL IsCompany;
/// The bool value indicating if this client has accepted their liability release (Readonly)
@property (assign, nonatomic) BOOL LiabilityRelease;
/// Email opt-in status to the notification
@property (assign, nonatomic) BOOL EmailOptIn;
// Prospect status
@property (assign, nonatomic) BOOL IsProspect;
// Company active status. YES if the client is inactive
@property (assign, nonatomic) BOOL Inactive;
// Determine whether the client is notified via the email about new promotions
@property (assign, nonatomic) BOOL PromotionalEmailOptIn;

/// Determine if the value is specified
@property (assign, nonatomic) BOOL IsCompanySpecified;
/// Determine if the value is specified
@property (assign, nonatomic) BOOL LiabilityReleaseSpecified;
/// Determine if the value is specified
@property (assign, nonatomic) BOOL EmailOptInSpecified;
/// Determine if the value is specified
@property (assign, nonatomic) BOOL IsProspectSpecified;
/// Determine if the value is specified
@property (assign, nonatomic) BOOL InactiveSpecified;
/// Determine if the value is specified
@property (assign, nonatomic) BOOL PromotionalEmailOptInSpecified;

/// Home location
@property (strong, nonatomic) Location *HomeLocation;
/// The client's credit card information.
@property (strong, nonatomic) ClientCreditCard *CreditCard;

@end
