//
//  GetClientIndexesResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/6/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBResult.h"
#import "ClientIndex.h"
#import "IndexValue.h"
/*!
 Represents a client indexes response from the server.
 */
@interface ClientIndexesResult : MBResult
{
    // Holders
    ClientIndex *index;
    IndexValue *indexValue;
    NSMutableArray *values;
}
/// Collection of ClientIndex
@property (nonatomic, strong) NSMutableArray *ClientIndexes;

@end
