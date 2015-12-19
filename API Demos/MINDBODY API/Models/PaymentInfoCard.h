//
//  PaymentInfoCard.h
//  API Demos
//
//  Created by Blackbolt on 12/9/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "PaymentInfo.h"
#import "ClientCreditCard.h"
/*!
 @brief Debit/Credit card payment
 */
@interface PaymentInfoCard : PaymentInfo

@property(nonatomic, strong) ClientCreditCard *card;

@end
