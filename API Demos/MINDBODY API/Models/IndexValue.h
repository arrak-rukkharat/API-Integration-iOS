//
//  IndexValue.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/6/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataMapper.h"
/*!
 @brief Represents a value of the client index
 */
@interface IndexValue : DataMapper
/// The value ID for this index
@property (nonatomic, strong) NSString *ID;
/// The name value of the index
@property (nonatomic, strong) NSString *Name;

@end
