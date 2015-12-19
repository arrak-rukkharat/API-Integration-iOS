//
//  ClientMembership.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/29/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceCategory.h"
/*!
 @brief Represents a membership
 */
@interface ClientMembership : DataMapper
{
    NSString *paymentDateString, *activeDateString, *expDateString;
}

/// Determines if the membership is current
@property (nonatomic, assign) BOOL Current;
/// Services in total for sell
@property (nonatomic, assign) int Count;
/// Remaining memberships for sell
@property (nonatomic, assign) int Remaining;
/// Service ID
@property (nonatomic, strong) NSString *ID;
/// The name
@property (nonatomic, strong) NSString *Name;
/// The payment date
@property (nonatomic, strong) NSDate *PaymentDate;
/// The active date
@property (nonatomic, strong) NSDate *ActiveDate;
/// The expiration date
@property (nonatomic, strong) NSDate *ExpirationDate;
/// The service category related to this service
@property (nonatomic, strong) ServiceCategory *ServiceCategory;


@end
