//
//  ClientCreditCard.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/2/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataMapper.h"
/*!
 @brief Represents a client credit card with SENSITIVE information
 */
@interface ClientCreditCard : DataMapper
/// Card type (eg Visa, Master Card, American Express
@property (strong, nonatomic) NSString *CardType;
/// Last 4 digits of the credit card
@property (strong, nonatomic) NSString *LastFour;
/// Credit card number
@property (strong, nonatomic) NSString *CardNumber;
/// Credit card holder's name
@property (strong, nonatomic) NSString *CardHolder;
/// Expired month
@property (strong, nonatomic) NSString *ExpMonth;
/// Expired year
@property (strong, nonatomic) NSString *ExpYear;
/// The billing address
@property (strong, nonatomic) NSString *Address;
/// City in the billing address
@property (strong, nonatomic) NSString *City;
/// State in the billing address
@property (strong, nonatomic) NSString *State;
/// Postal code in the billing address
@property (strong, nonatomic) NSString *PostalCode;
@end
