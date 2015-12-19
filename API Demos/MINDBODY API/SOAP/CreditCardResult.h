//
//  GetClientCreditCardResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/3/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBResult.h"
#import "ClientCreditCard.h"

@interface CreditCardResult : MBResult
{
    // Temp objects
    ClientCreditCard *card;
}
/// The credit card from the response
@property (nonatomic, strong) ClientCreditCard *CreditCard;

@end
