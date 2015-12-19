//
//  Service.h
//  MB API Driver
//
//  Created by Arrak Rukkharat on 8/19/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckoutItem.h"
#import "ServiceCategory.h"

/*!
 Represents a service or a pass that can pay for classes or an appointment
 */
@interface Service : CheckoutItem
{
    NSString *paymentDateString, *activeDateString, *expDateString;
}
/// Services in total for sell
@property (nonatomic, assign) int Count;
/// Remaining services for sell
@property (nonatomic, strong) NSString *TaxRate;
/// The price
@property (nonatomic, strong) NSString *Price;
/// The online price
@property (nonatomic, strong) NSString *OnlinePrice;
/// The payment date
@property (nonatomic, strong) NSDate *PaymentDate;
/// The active date
@property (nonatomic, strong) NSDate *ActiveDate;
/// The expiration date
@property (nonatomic, strong) NSDate *ExpirationDate;
/// Current service
@property (nonatomic, assign) BOOL Current;

@property (nonatomic, strong) ServiceCategory *ServiceCategory;

- (void)mapElement:(NSString*)element with:(NSString*)string;
- (void)finish;
@end
