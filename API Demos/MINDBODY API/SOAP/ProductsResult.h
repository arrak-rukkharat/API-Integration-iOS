//
//  ProductsResult.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/21/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface ProductsResult : MBResult
{
    Product *product;
    NSMutableArray *products;
}
/// Collection of Product
@property (nonatomic, strong) NSArray *Products;

@end
