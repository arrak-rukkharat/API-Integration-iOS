//
//  ClientIndex.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/6/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataMapper.h"
/*!
 @brief Represents additional information options about the client
 */
@interface ClientIndex : DataMapper
// The unique ID of the client index
@property (nonatomic, strong) NSString *ID;
/// The name of the index
@property (nonatomic, strong) NSString *Name;
/// Collection of IndexValue
@property (nonatomic, strong) NSMutableArray *Values;

@end
