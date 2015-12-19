//
//  Permission.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/27/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataMapper.h"
/*!
 @brief Represents a permission for a staff member
 */
@interface Permission : DataMapper
/// Permission display name or descriptive title
@property(nonatomic, strong) NSString *DisplayName;
/// Actual permission name in the database
@property(nonatomic, strong) NSString *Name;
/// The value for the permission name
@property(nonatomic, strong) NSString *Value;

@end
