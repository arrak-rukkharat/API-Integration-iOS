//
//  SiteService.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLSiteService.h"
#import "MBResponseObjects.h"


/*!
 Consists of methods that are mainly responsible for viewing information including site, location, service categories, resources, session types, and relationship types.
 */

@interface SiteService : NSObject
/*!
 Search for sites that the source has access to. The search is based on the site title and site ID
 */
//+ (void)SearchSites:(NSString*)text withBlock:(void (^)(SitesResult* result))block;

/*!
 Get a list of sites related to the given site ID
 */
//+ (void)GetSitesRelatedToSiteID:(NSString*)siteID withBlock:(void (^)(SitesResult* result))block;

/*!
 Retrive a list of locations for the current source
 */
+ (void)GetLocationsWithBlock:(void (^)(LocationsResult* result))block;

/*!
 Retrive a list of appointment categories available for the studio(s)
 */
+ (void)GetServiceCategoriesTypeAppointmentWithBlock:(void (^)(ServiceCategoriesResult* result))block;

/*!
 Retrive a list of class categories available for the studio(s)
 */
+ (void)GetServiceCategoriesTypeClassWithBlock:(void (^)(ServiceCategoriesResult* result))block;

/*!
 Retrive a list of all categories available for the studio(s)
 */
+ (void)GetServiceCategoriesTypeAllWithBlock:(void (^)(ServiceCategoriesResult* result))block;

/*!
 Retrive a list of session types available for the studio(s)
 */
+ (void)GetSessionTypesWithBlock:(void (^)(SessionTypesResult* result))block;

/*!
 Retrive a list of session types filterd by the service category IDs (NSString)
 */
+ (void)GetSessionTypesByserviceCategoryIDs:(NSMutableArray*)progIDs withBlock:(void (^)(SessionTypesResult* result))block;
@end
