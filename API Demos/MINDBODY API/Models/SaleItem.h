//
//  SaleItem.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/12/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sale.h"
/*!
 @brief Represents an item for checkout
 */
@interface SaleItem : DataMapper
/// The description
@property(nonatomic, strong) NSString *DescriptionText;
/// The price
@property(nonatomic, strong) NSString *Price;
/// The paid amount
@property(nonatomic, strong) NSString *AmountPaid;
/// The discount
@property(nonatomic, strong) NSString *Discount;
/// The tax
@property(nonatomic, strong) NSString *Tax;
/// Determines if the sale is returned
@property(nonatomic, assign) BOOL Returned;
/// The quantity
@property(nonatomic, strong) NSString *Quantity;
/// The sale
@property(nonatomic, strong) Sale *Sale;
@end
