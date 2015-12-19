//
//  Payment.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/12/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataMapper.h"

/*!
 @brief Represents a payment for a sale
 */
@interface Payment : DataMapper
{
    
}
/// The payment ID
@property (nonatomic, strong) NSString *ID;
/// The payment amount. This uses string because all caculations are done by the API
@property (nonatomic, strong) NSString *Amount;
/// Payment method in integer
@property (nonatomic, assign) int Method;
/// Type of payment
@property (nonatomic, strong) NSString *Type;
/// Payment notes
@property (nonatomic, strong) NSString *Notes;

@end
