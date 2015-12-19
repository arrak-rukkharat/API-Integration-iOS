//
//  Program.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataMapper.h"
/*!
 @brief Represents a service category or program for classes and appointments
 */
@interface ServiceCategory : DataMapper
/// The service category ID
@property (nonatomic, strong) NSString *ID;
/// The service category's title
@property (nonatomic, strong) NSString *Name;
/// Service category's type
@property (nonatomic, strong) NSString *ScheduleType;
/// The offset in seconds that allows cancelling
@property (nonatomic, assign) int CancelOffset;

@end
