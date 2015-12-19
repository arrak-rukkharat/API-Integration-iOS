//
//  Sale.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/12/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"
/*!
 @brief Represents a sale info
 */
@interface Sale : DataMapper
{
    NSString *saleTime, *saleDate, *saleDateTime;
}
/// The payment ID
@property (nonatomic, strong) NSString *ID;
/// The sale time
@property (nonatomic, strong) NSDate *SaleTime;
/// The sale date time
@property (nonatomic, assign) NSDate *SaleDateTime;
/// The sale date
@property (nonatomic, strong) NSDate *SaleDate;
/// The location
@property (nonatomic, strong) Location *Location;
/// Collection of Payment.
@property (nonatomic, strong) NSArray *Payments;
@end
