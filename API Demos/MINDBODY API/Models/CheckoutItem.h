//
//  CheckoutItem.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/22/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataMapper.h"
/*!
 Represents an item that can be checked out
 */
@interface CheckoutItem : DataMapper
/// The ID used in cart checkout
@property (nonatomic, strong) NSString *ID;
/// The name of the item
@property (nonatomic, strong) NSString *Name;
@end
