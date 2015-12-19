//
//  SalesResult.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/18/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "MBResult.h"

@interface SalesResult : MBResult
{
    Sale *sale;
    Payment *payment;
    NSMutableArray *payments, *sales;
    NSString *saleTime, *saleDate, *saleDateTime;
}

@property (nonatomic, strong) NSArray *Sales;

@end
