//
//  PaymentInfoCash.h
//  API Demos
//
//  Created by Blackbolt on 12/9/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "PaymentInfo.h"
/*!
 @brief Cash payment. If the item is $0, clients can use this type of payment,
 otherwise, staff credentials must be provided.
 */
@interface PaymentInfoCash : PaymentInfo

@end
