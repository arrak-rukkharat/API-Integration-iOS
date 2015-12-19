//
//  XMLSaleService.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/18/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#include "MBConstants.h"
#import "SourceCredentials.h"
#import "UserCredentials.h"
#import "Sale.h"
#import "CartItem.h"
#import "Service.h"
#import "Product.h"
#import "Package.h"
#import "ClientCreditCard.h"
#import "Utils.h"
#import "ScheduleItem.h"
#import "PaymentInfo.h"
#import "PaymentInfoAccount.h"
#import "PaymentInfoCard.h"
#import "PaymentInfoCash.h"
#import "PaymentInfoGiftCard.h"

#import <Foundation/Foundation.h>

@interface XMLSaleService : NSObject

+ (NSURLRequest*) SOAPGetSalesFromDateTime:(NSDate*)startDateTime endDateTime:(NSDate*)endDateTime filterByPaymentMethodID:(NSString*)paymentMethodID;

+ (NSURLRequest*) SOAPGetServicesByClassID:(NSString*)classID byClassScheduleID:(NSString*)scheduleID byserviceCategoryIDs:(NSArray*)serviceCategoryIDs bySessionTypeIDs:(NSArray*)sessionTypeIDs byServiceIDs:(NSArray*)serviceIDs;

+ (NSURLRequest*) SOAPGetPackagesOnlineOnly:(BOOL)onlineOnly;

+ (NSURLRequest*) SOAPGetProducts:(NSString*)searchText byCategoryIDs:(NSArray*)categoryIDs bySubCategoryIDs:(NSArray*)subCategoryIDs byProductIDs:(NSArray*)productIDs;

+ (NSURLRequest*) SOAPCheckoutCartItems:(NSArray*)cartItems clientID:(NSString*)clientID payment:(PaymentInfo*)payment visitIDOrNil:(NSString*)visitID scheduleItem:(ScheduleItem*)sch classID:(NSString*)classID;

+ (NSURLRequest*) SOAPGetCartTotal:(NSArray*)cartItems clientID:(NSString*)clientID promo:(NSString*)promocode;
@end
