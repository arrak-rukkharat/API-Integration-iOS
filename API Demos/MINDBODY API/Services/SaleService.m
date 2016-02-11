//
//  SaleService.m
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/18/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "SaleService.h"

@implementation SaleService

+ (void)GetSalesFromDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime filterByPaymentMethodID:(NSString*)paymentMethodID withBlock:(void (^)(SalesResult* result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetSalesFromDateTime:startDateTime endDateTime:endDateTime filterByPaymentMethodID:paymentMethodID];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          SalesResult *result = [SalesResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetServicesWithBlock:(void (^)(ServicesResult* result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetServicesByClassID:nil byClassScheduleID:nil byserviceCategoryIDs:nil bySessionTypeIDs:nil byServiceIDs:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ServicesResult *result = [ServicesResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetServicesByClassScheduleID:(NSString*)classScheduleID withBlock:(void (^)(ServicesResult* result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetServicesByClassID:nil byClassScheduleID:classScheduleID byserviceCategoryIDs:nil bySessionTypeIDs:nil byServiceIDs:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ServicesResult *result = [ServicesResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetServicesByClassID:(NSString*)classID withBlock:(void (^)(ServicesResult* result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetServicesByClassID:classID byClassScheduleID:nil byserviceCategoryIDs:nil bySessionTypeIDs:nil byServiceIDs:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ServicesResult *result = [ServicesResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetServicesByserviceCategoryIDs:(NSArray*)serviceCategoryIDs withBlock:(void (^)(ServicesResult* result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetServicesByClassID:nil byClassScheduleID:nil byserviceCategoryIDs:nil bySessionTypeIDs:nil byServiceIDs:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ServicesResult *result = [ServicesResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetServicesBySessionTypeIDs:(NSMutableArray*)sessionTypeIDs withBlock:(void (^)(ServicesResult* result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetServicesByClassID:nil byClassScheduleID:nil byserviceCategoryIDs:nil bySessionTypeIDs:sessionTypeIDs byServiceIDs:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ServicesResult *result = [ServicesResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetServicesByServiceIDs:(NSArray*)serviceIDs withBlock:(void (^)(ServicesResult* result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetServicesByClassID:nil byClassScheduleID:nil byserviceCategoryIDs:nil bySessionTypeIDs:nil byServiceIDs:serviceIDs];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ServicesResult *result = [ServicesResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetPackagesWithBlock:(void (^)(PackagesResult* result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetPackagesOnlineOnly:false];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          PackagesResult *result = [PackagesResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetOnlinePackagesWithBlock:(void (^)(PackagesResult* result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetPackagesOnlineOnly:true];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          PackagesResult *result = [PackagesResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetProductsWithBlock:(void (^)(ProductsResult *result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetProducts:nil byCategoryIDs:nil bySubCategoryIDs:nil byProductIDs:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ProductsResult *result = [ProductsResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)SearchProducts:(NSString*)searchText withBlock:(void (^)(ProductsResult *result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetProducts:searchText byCategoryIDs:nil bySubCategoryIDs:nil byProductIDs:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ProductsResult *result = [ProductsResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetProductsByCategoryIDs:(NSArray*)array withBlock:(void (^)(ProductsResult *result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetProducts:nil byCategoryIDs:array bySubCategoryIDs:nil byProductIDs:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ProductsResult *result = [ProductsResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetProductsBySubCategoryIDs:(NSArray*)array withBlock:(void (^)(ProductsResult *result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetProducts:nil byCategoryIDs:nil bySubCategoryIDs:array byProductIDs:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ProductsResult *result = [ProductsResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetProductsByProductIDs:(NSArray*)array withBlock:(void (^)(ProductsResult *result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetProducts:nil byCategoryIDs:nil bySubCategoryIDs:nil byProductIDs:array];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ProductsResult *result = [ProductsResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)GetCartTotalWithCartItems:(NSArray*)cartItems clientID:(NSString*)clientID promo:(NSString*)promocode withBlock:(void (^)(ReceiptResult *result))block
{
    NSURLRequest *request = [XMLSaleService SOAPGetCartTotal:cartItems clientID:clientID promo:promocode];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ReceiptResult *result = [ReceiptResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)CheckoutCartItems:(NSArray*)cartItems forClientID:(NSString*)clientID withPayment:(PaymentInfo*)payment withBlock:(void (^)(ReceiptResult *result))block
{
    NSURLRequest *request = [XMLSaleService SOAPCheckoutCartItems:cartItems clientID:clientID payment:payment visitIDOrNil:nil scheduleItem:nil classID:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ReceiptResult *result = [ReceiptResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}


/*
+ (void)ReconcileUnpaidVisit:(NSString*)visitID service:(Service*)service amountTotal:(NSString*)amount withPromocodeOrNil:(NSString*)promo forClientID:(NSString*)clientID sendEmail:(BOOL)sendEmail withBlock:(void (^)(ReceiptResult *result))block
{
    NSMutableArray *cartItems = [NSMutableArray new];
    [cartItems addObject:service];
    
    NSURLRequest *request = [XMLSaleService SOAPCheckoutCartItems:cartItems clientID:clientID amount:amount creditCard:nil giftCard:nil useAccountBalance:YES promo:promo sendEmail:sendEmail visitIDOrNil:visitID scheduleItem:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ReceiptResult *result = [ReceiptResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}*/

+ (void)BuyAndBookAnAppointmentWithSchedule:(ScheduleItem*)schedule serviceID:(NSString*)serviceID withPayment:(PaymentInfo*)payment forClientID:(NSString*)clientID withBlock:(void (^)(ReceiptResult *result))block
{
    CartItem *ci = [CartItem new];
    ci.Quantity = 1;
    ci.Item = [Service new];
    ci.Item.ID = serviceID;
    NSArray *cartItems = [[NSArray alloc] initWithObjects:ci, nil];
    
    NSURLRequest *request = [XMLSaleService SOAPCheckoutCartItems:cartItems clientID:clientID payment:payment visitIDOrNil:nil scheduleItem:schedule classID:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ReceiptResult *result = [ReceiptResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}

+ (void)BuyAndBookAClassWithClassID:(NSString*)classID serviceID:(NSString*)serviceID withPayment:(PaymentInfo*)payment forClientID:(NSString*)clientID withBlock:(void (^)(ReceiptResult *result))block
{
    CartItem *ci = [CartItem new];
    ci.Quantity = 1;
    ci.Item = [Service new];
    ci.Item.ID = serviceID;
    NSArray *cartItems = [[NSArray alloc] initWithObjects:ci, nil];
    
    NSURLRequest *request = [XMLSaleService SOAPCheckoutCartItems:cartItems clientID:clientID payment:payment visitIDOrNil:nil scheduleItem:nil classID:classID];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ReceiptResult *result = [ReceiptResult new];
          [result mapData:data];
          block(result);
          
      }] resume];
}


@end
