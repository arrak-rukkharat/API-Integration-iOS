//
//  Package.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/19/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckoutItem.h"
/*!
 @brief Represents a combined product consisting of products and services
 */
@interface Package : CheckoutItem

/// The discount in percentage
@property (nonatomic, strong) NSString *DiscountPercentage;
/// Determine if the package is online sale
@property (nonatomic, assign) BOOL SellOnline;
/// Collection of Service
@property (nonatomic, strong) NSArray *Services;
/// Collection of Product
@property (nonatomic, strong) NSArray *Products;

- (void)mapElement:(NSString*)element with:(NSString*)string;
- (void)finish;

@end
