//
//  SaleService.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/18/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLSaleService.h"
#import "MBResponseObjects.h"

/*!
 Contains a group of methods that are mainly responsible for
 completing service and product purchases, viewing pricing options, products, and packages.
 */
@interface SaleService : NSObject

/*!
 Retrive sales information for specific dates. This requires staff credentials.
 @param startDateTime
 @param endDateTime
 */
+ (void)GetSalesFromDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime filterByPaymentMethodID:(NSString*)paymentMethodID withBlock:(void (^)(SalesResult* result))block;

/*!
 Retrive all services available for the studio.
 */
+ (void)GetServicesWithBlock:(void (^)(ServicesResult* result))block;

/*!
 Retrive services filtered by class schedule
 @param classScheduleID
 */
+ (void)GetServicesByClassScheduleID:(NSString*)classScheduleID withBlock:(void (^)(ServicesResult* result))block;

/*!
 Retrive services filtered by a class
 @param classID
 */
+ (void)GetServicesByClassID:(NSString*)classID withBlock:(void (^)(ServicesResult* result))block;

/*!
 Retrive services filtered by service categories
 @param serviceCategoryIDs
 */
+ (void)GetServicesByserviceCategoryIDs:(NSArray*)serviceCategoryIDs withBlock:(void (^)(ServicesResult* result))block;

/*!
 Retrive services filtered by session types
 @param sessionTypeIDs
 */
+ (void)GetServicesBySessionTypeIDs:(NSMutableArray*)sessionTypeIDs withBlock:(void (^)(ServicesResult* result))block;

/*!
 Retrive services for given service IDs
 @param serviceIDs service IDs in NSString
 */
+ (void)GetServicesByServiceIDs:(NSArray*)serviceIDs withBlock:(void (^)(ServicesResult* result))block;

/*!
 Retrive all packages available in the studio
 */
+ (void)GetPackagesWithBlock:(void (^)(PackagesResult* result))block;

/*!
 Retrive only online packages available in the studio
 */
+ (void)GetOnlinePackagesWithBlock:(void (^)(PackagesResult* result))block;

/*!
 Retrive all products available in the store
 */
+ (void)GetProductsWithBlock:(void (^)(ProductsResult *result))block;

/*!
 Search for product(s) based on product name
 @param searchText
 */
+ (void)SearchProducts:(NSString*)searchText withBlock:(void (^)(ProductsResult *result))block;

/*!
 Retrive products filtered by categories
 @param array list of category IDs in NSString
 */
+ (void)GetProductsByCategoryIDs:(NSArray*)array withBlock:(void (^)(ProductsResult *result))block;

/*!
 Retrive products filtered by subcategories
 @param array list of subcategory IDs in NSString
 */
+ (void)GetProductsBySubCategoryIDs:(NSArray*)array withBlock:(void (^)(ProductsResult *result))block;

/*!
 Retrive products filtered by product IDs
 @param array list of product IDs in NSString
 */
+ (void)GetProductsByProductIDs:(NSArray*)array withBlock:(void (^)(ProductsResult *result))block;

/*!
 Checkout items for a specified client ID.
 @param cartItems collection of CartItem
 @param clientID client ID for this checkout
 @param payment manually constructed payment information

 @param sendEmail determine whether the system should send the checkout information to the client via email
 */
+ (void)CheckoutCartItems:(NSArray*)cartItems forClientID:(NSString*)clientID withPayment:(PaymentInfo*)payment withBlock:(void (^)(ReceiptResult *result))block;

/*!
 Calculate the grand total of the cart
 @param cartItems items in the cart
 @param clientID client ID for this checkout
 @param promocode the discount promocode
 */
+ (void)GetCartTotal:(NSArray*)cartItems clientID:(NSString*)clientID promo:(NSString*)promocode withBlock:(void (^)(ReceiptResult *result))block;

/*!
 Use this to book an appointment with buying a service!
 @param schedule schedule item (usually from GetBookableItems())
 @param serviceID the service will be purchased and used to book the appointment
 @param payment manually constructed payment information
 @param clientID client ID for this checkout
 */
+ (void)CheckoutAppointmentSchedule:(ScheduleItem*)schedule serviceID:(NSString*)serviceID withPayment:(PaymentInfo*)payment forClientID:(NSString*)clientID withBlock:(void (^)(ReceiptResult *result))block;

/*!
 Use this to enroll a client to a class with buying a service!
 @param classID
 @param serviceID the service will be purchased and used to book the appointment
 @param payment manually constructed payment information
 @param clientID client ID for this checkout
 */
+ (void)CheckoutAndEnrollClassID:(NSString*)classID serviceID:(NSString*)serviceID withPayment:(PaymentInfo*)payment forClientID:(NSString*)clientID withBlock:(void (^)(ReceiptResult *result))block;

@end
