//
//  ClientMembershipsResult.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/29/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface ClientMembershipsResult : MBResult
{
    ClientMembership *membership;
    ServiceCategory *prg;
    
}
/// Collection of ClientMembership
@property (nonatomic, strong) NSMutableArray *ClientMemberships;
@end
