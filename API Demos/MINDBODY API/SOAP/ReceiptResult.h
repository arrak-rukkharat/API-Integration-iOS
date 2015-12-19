//
//  ReceiptResult.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/28/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface ReceiptResult : MBResult
{
    Product *product;
    Service *service;
    Package *package;
    NSMutableArray *products;
    CartItem *cartItem;
    NSMutableArray *cartItems;
}
/// The recipt consisting the cart details
@property (nonatomic, strong) Receipt *Receipt;

@end
