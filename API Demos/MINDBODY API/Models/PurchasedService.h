//
//  Service.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/10/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceCategory.h"
#import "DataMapper.h"

/*!
 @brief Represents client service
 */
@interface PurchasedService : DataMapper
{
    NSString *paymentDateString, *activeDateString, *expDateString;
}
/// Determines if the service is current
@property (nonatomic, assign) BOOL Current;
/// Services in total for sell
@property (nonatomic, assign) int Count;
/// Remaining services for sell
@property (nonatomic, assign) int Remaining;
/// Service ID
@property (nonatomic, strong) NSString *ID;
/// The service name
@property (nonatomic, strong) NSString *Name;
/// The payment date
@property (nonatomic, strong) NSDate *PaymentDate;
/// The active date
@property (nonatomic, strong) NSDate *ActiveDate;
/// The expiration date
@property (nonatomic, strong) NSDate *ExpirationDate;
/// The program related to this service
@property (nonatomic, strong) ServiceCategory *ServiceCategory;

@end
