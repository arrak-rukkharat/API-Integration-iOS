//
//  Receipt.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/28/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartItem.h"

/*!
 @brief Represents receipt for a shopping cart checkout
 */
@interface Receipt : DataMapper
{
    
}
/// The sub total
@property (nonatomic, strong) NSString *SubTotal;
/// The tax total
@property (nonatomic, strong) NSString *TaxTotal;
/// The total discount
@property (nonatomic, strong) NSString *DiscountTotal;
/// The grand total of the entire cart
@property (nonatomic, strong) NSString *GrandTotal;
/// Collection of CartItem
@property (nonatomic, strong) NSArray *CartItems;

@end
