//
//  PaymentInfo.h
//  API Demos
//
//  Created by Blackbolt on 12/9/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 @brief Payment info interface. See PaymentInfoCard, PaymentInfoGiftCard, PaymentInfoAccount, and PaymentInfoCash
 */
@interface PaymentInfo : NSObject


/// Payment amount when checkout
@property(nonatomic, strong) NSString *AmountTotal;
/// Promocode for the current payment info.
@property(nonatomic, strong) NSString *Promocode;
/// Determine if the system should notify the client via email after payment is complete. No by default.
@property(nonatomic, assign) BOOL SendEmail;

@end
