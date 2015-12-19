//
//  Location.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/26/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataMapper.h"
/*!
 @brief Represents a location
 */
@interface Location : DataMapper

/// The business ID of this location. This field is the unique ID for locations that do NOT have an associated site
@property (assign, nonatomic) int BusinessID;
/// The site ID of this location
@property (assign, nonatomic) int SiteID;
/// The description of this business
@property (strong, nonatomic) NSString *BusinessDescription;
/// An array of strings containing additional image URLs of the location
@property (strong, nonatomic) NSMutableArray *AdditionalImageURLs;
/// Size in square feet of the location
@property (assign, nonatomic) int FacilitySquareFeet;
/// Number of treatment rooms at location
@property (assign, nonatomic) int TreatmentRooms;
/// Whether the site is a Professional Spa Finder site
@property (assign, nonatomic) BOOL ProSpaFinderSite;
/// If the location has classes
@property (assign, nonatomic) BOOL HasClasses;
/// Location phone extension
@property (strong, nonatomic) NSString *PhoneExtension;
/// The unique ID for the location
@property (strong, nonatomic) NSString *ID;
/// The name of the location
@property (strong, nonatomic) NSString *Name;
/// Address of the loaction
@property (strong, nonatomic) NSString *Address;
/// Additional address info
@property (strong, nonatomic) NSString *Address2;
/// Tax rate
@property (assign, nonatomic) double Tax1;
/// Additional tax rate
@property (assign, nonatomic) double Tax2;
/// Additional tax rate
@property (assign, nonatomic) double Tax3;
/// Additional tax rate
@property (assign, nonatomic) double Tax4;
/// Additional tax rate
@property (assign, nonatomic) double Tax5;
/// The phone number of the location
@property (strong, nonatomic) NSString *Phone;
/// The city of the location
@property (strong, nonatomic) NSString *City;
/// The state / province of the location
@property (strong, nonatomic) NSString *StateProvCode;
/// The postal code of the location
@property (strong, nonatomic) NSString *PostalCode;
/// The Latitude of the location
@property (assign, nonatomic) double Latitude;
/// The longitude of the location
@property (assign, nonatomic) double Longitude;
/// Location's distance in miles
@property (assign, nonatomic) double DistanceInMiles;
/// The image URL of the location
@property (strong, nonatomic) NSString *ImageURL;
/// The description of the location
@property (strong, nonatomic) NSString *Description;
/// Whether the location has an MB site that is available to consumers
@property (assign, nonatomic) BOOL HasSite;
/// Whether the location can have classes reserved / appointments booked
@property (assign, nonatomic) BOOL CanBook;

@end
