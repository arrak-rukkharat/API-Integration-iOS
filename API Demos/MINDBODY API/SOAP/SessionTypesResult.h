//
//  SessionTypesResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBResult.h"

@interface SessionTypesResult : MBResult
{
    SessionType *sess;
}
/// Collection of SessionType
@property (nonatomic, strong) NSMutableArray *SesstionTypes;

@end
