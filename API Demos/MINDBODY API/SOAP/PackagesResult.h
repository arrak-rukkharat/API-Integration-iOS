//
//  PackagesResult.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/20/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface PackagesResult : MBResult
{
    Package *package;
    Service *service;
    Product *product;
    
    //NSString *taxrate;
    
    NSMutableArray *services;
    NSMutableArray *products;
    NSMutableArray *packages;
}
/// Collection of Package
@property (nonatomic, strong) NSArray *Packages;

@end
