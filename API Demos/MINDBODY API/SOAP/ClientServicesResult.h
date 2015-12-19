//
//  ClientServicesResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/10/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface ClientServicesResult : MBResult
{
    PurchasedService *service;
    ServiceCategory *prg;
    //NSString *paymentDateString, *activeDateString, *expDateString;
}
/// Collection of Service
@property (nonatomic, strong) NSMutableArray *Services;

@end
