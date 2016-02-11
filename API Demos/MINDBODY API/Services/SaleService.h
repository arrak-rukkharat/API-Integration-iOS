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
 */
+ (void)GetSalesFromDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime filterByPaymentMethodID:(NSString*)paymentMethodID withBlock:(void (^)(SalesResult* result))block;

/*!
 Retrive all services available for the studio.
 */
+ (void)GetServicesWithBlock:(void (^)(ServicesResult* result))block;

/*!
 Retrive services filtered by class schedule
 */
+ (void)GetServicesByClassScheduleID:(NSString*)classScheduleID withBlock:(void (^)(ServicesResult* result))block;

/*!
 Retrive services filtered by a class
 */
+ (void)GetServicesByClassID:(NSString*)classID withBlock:(void (^)(ServicesResult* result))block;

/*!
 Retrive services filtered by service categories
 */
+ (void)GetServicesByserviceCategoryIDs:(NSArray*)serviceCategoryIDs withBlock:(void (^)(ServicesResult* result))block;

/*!
 Retrive services filtered by session types
 */
+ (void)GetServicesBySessionTypeIDs:(NSMutableArray*)sessionTypeIDs withBlock:(void (^)(ServicesResult* result))block;

/*!
 Retrive services for given service IDs
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
 */
+ (void)SearchProducts:(NSString*)searchText withBlock:(void (^)(ProductsResult *result))block;

/*!
 Retrive products filtered by categories
 */
+ (void)GetProductsByCategoryIDs:(NSArray*)array withBlock:(void (^)(ProductsResult *result))block;

/*!
 Retrive products filtered by subcategories
 */
+ (void)GetProductsBySubCategoryIDs:(NSArray*)array withBlock:(void (^)(ProductsResult *result))block;

/*!
 Retrive products filtered by product IDs
 */
+ (void)GetProductsByProductIDs:(NSArray*)array withBlock:(void (^)(ProductsResult *result))block;

/*!
 Checkout items for a specified client ID.

 @param sendEmail determine whether the system should send the checkout information to the client via email
 */
+ (void)CheckoutCartItems:(NSArray*)cartItems forClientID:(NSString*)clientID withPayment:(PaymentInfo*)payment withBlock:(void (^)(ReceiptResult *result))block;

/*!
 Calculate the grand total of the cart
 */
+ (void)GetCartTotalWithCartItems:(NSArray*)cartItems clientID:(NSString*)clientID promo:(NSString*)promocode withBlock:(void (^)(ReceiptResult *result))block;

/*!
 Use this to book an appointment with buying a service!
 */
+ (void)BuyAndBookAnAppointmentWithSchedule:(ScheduleItem*)schedule serviceID:(NSString*)serviceID withPayment:(PaymentInfo*)payment forClientID:(NSString*)clientID withBlock:(void (^)(ReceiptResult *result))block;

/*!
 Use this to enroll a client to a class with buying a service!
 */
+ (void)BuyAndBookAClassWithClassID:(NSString*)classID serviceID:(NSString*)serviceID withPayment:(PaymentInfo*)payment forClientID:(NSString*)clientID withBlock:(void (^)(ReceiptResult *result))block;

@end
