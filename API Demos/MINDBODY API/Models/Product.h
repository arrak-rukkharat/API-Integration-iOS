//
//  Product.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/20/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckoutItem.h"
/*!
 @brief Represents a product for sale in the online store
 */
@interface Product : CheckoutItem

/// The sales tax for this product
@property (nonatomic, strong) NSString *TaxRate;
/// ??? The tax
@property (nonatomic, strong) NSString *TaxIncluded;
/// The group ID
@property (nonatomic, strong) NSString *GroupID;
/// The online price
@property (nonatomic, strong) NSString *OnlinePrice;
/// The actual price of the product
@property (nonatomic, strong) NSString *Price;
/// The color ID
@property (nonatomic, strong) NSString *ColorID;
/// The name of the color
@property (nonatomic, strong) NSString *ColorName;
/// The size ID
@property (nonatomic, strong) NSString *SizeID;
/// The name of the size
@property (nonatomic, strong) NSString *SizeName;

- (void)mapElement:(NSString*)element with:(NSString*)string;
- (void)finish;

@end
