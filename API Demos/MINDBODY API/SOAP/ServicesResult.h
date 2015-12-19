//
//  ServicesResult.h
//  MB API Driver
//
//  Created by Arrak Rukkharat on 8/19/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface ServicesResult : MBResult
{
    Service *service;
    NSMutableArray *services;
    //NSString *taxrate;
}
/// Collection of Service
@property (nonatomic, strong) NSArray *Services;
@end
