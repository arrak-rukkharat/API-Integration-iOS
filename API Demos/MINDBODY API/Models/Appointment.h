//
//  Appointment.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 11/2/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "DataMapper.h"
#import "ServiceCategory.h"
#import "SessionType.h"
#import "Location.h"
#import "Staff.h"
#import "Client.h"
#import "PurchasedService.h"
#include "MBConstants.h"

/*!
 @brief Represents an appointment with the related information
 */
@interface Appointment : DataMapper
{
    NSString *startDateString, *endDateString;
}
/// Prefered gender of appointment
@property (nonatomic, strong) NSString *GenderPreference;
/// Duration of appointment. Only used to change appointment default duration for add.
@property (nonatomic, assign) int Duration;
/// If a user has Complementary and Alternative Medicine features enabled. This will allow a Provider ID to be assigned to an appointment.
@property (nonatomic, strong) NSString *ProviderID;
/// The status of this appointment.
@property (nonatomic, strong) NSString *Status;
/// The unique ID of the appointment
@property (nonatomic, strong) NSString *ID;
/// The date and time the appointment starts at.
@property (nonatomic, strong) NSDate *StartDateTime;
/// The date and time the appointment ends at.
@property (nonatomic, strong) NSDate *EndDateTime;
/// The appointment notes.
@property (nonatomic, strong) NSString *Notes;
/// Whether the staff member was requested specifically by the client.
@property (nonatomic, assign) bool StaffRequested;
/// The program or service category this appointment belongs to.
@property (nonatomic, strong) ServiceCategory *ServiceCategory;
/// The session type of this appointment.
@property (nonatomic, strong) SessionType *SessionType;
/// The location this appointment will take place.
@property (nonatomic, strong) Location *Location;
/// The staff member instructing this appointment.
@property (nonatomic, strong) Staff *Staff;
/// The client booked for this appointment.
@property (nonatomic, strong) Client *Client;
/// Whether this is the client's first appointment at the site.
@property (nonatomic, assign) BOOL FirstAppointment;
/// The service on the client's account that is paying for this appointment.
@property (nonatomic, strong) PurchasedService *ClientService;
/// The resources this appointment is using.
@property (nonatomic, strong) NSMutableArray *Resources;

@end
