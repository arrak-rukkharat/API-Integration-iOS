//
//  SiteService.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "SiteService.h"

@implementation SiteService

+ (void)SearchSites:(NSString*)text withBlock:(void (^)(SitesResult* result))block
{
    NSURLRequest *request = [XMLSiteService SOAPGetSites:nil filter:text];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          SitesResult *result = [SitesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetSitesRelatedToSiteID:(NSString*)siteID withBlock:(void (^)(SitesResult* result))block
{
    NSURLRequest *request = [XMLSiteService SOAPGetSites:siteID filter:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          SitesResult *result = [SitesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetLocationsWithBlock:(void (^)(LocationsResult* result))block
{
    NSURLRequest *request = [XMLSiteService SOAPGetLocations];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          LocationsResult *result = [LocationsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetServiceCategoriesTypeAppointmentWithBlock:(void (^)(ServiceCategoriesResult* result))block
{
    NSURLRequest *request = [XMLSiteService SOAPGetServiceCategories:SCH_TYPE_APPOINTMENT];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ServiceCategoriesResult *result = [ServiceCategoriesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetServiceCategoriesTypeClassWithBlock:(void (^)(ServiceCategoriesResult* result))block
{
    NSURLRequest *request = [XMLSiteService SOAPGetServiceCategories:SCH_TYPE_CLASS];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ServiceCategoriesResult *result = [ServiceCategoriesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetServiceCategoriesTypeAllWithBlock:(void (^)(ServiceCategoriesResult* result))block
{
    NSURLRequest *request = [XMLSiteService SOAPGetServiceCategories:SCH_TYPE_ALL];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ServiceCategoriesResult *result = [ServiceCategoriesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetSessionTypesWithBlock:(void (^)(SessionTypesResult* result))block
{
    NSURLRequest *request = [XMLSiteService SOAPGetSessionTypes:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          SessionTypesResult *result = [SessionTypesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetSessionTypesByserviceCategoryIDs:(NSMutableArray*)progIDs withBlock:(void (^)(SessionTypesResult* result))block
{
    NSURLRequest *request = [XMLSiteService SOAPGetSessionTypes:progIDs];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          SessionTypesResult *result = [SessionTypesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

@end
