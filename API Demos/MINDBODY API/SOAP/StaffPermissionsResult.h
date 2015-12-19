//
//  GetStaffPermissionsResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/27/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBResult.h"
@interface StaffPermissionsResult : MBResult
{
    Permission *per;
    NSMutableArray *permissions;
}
/// Collection of Permission
@property (nonatomic, strong) NSArray *Permissions;
@end
