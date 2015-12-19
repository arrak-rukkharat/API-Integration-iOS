//
//  GetStaffResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/23/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//
#import "MBResult.h"
#import <Foundation/Foundation.h>

@interface StaffMembersResult : MBResult
{
    Staff *staff;
    NSMutableArray *staffMembers;
}
/// Collection of Staff
@property(nonatomic, strong) NSArray *StaffMembers;

@end
