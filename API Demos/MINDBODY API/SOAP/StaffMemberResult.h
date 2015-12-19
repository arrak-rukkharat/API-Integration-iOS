//
//  AddStaffResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/26/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBResult.h"

@interface StaffMemberResult :MBResult
{
    Staff *staff;
    NSMutableArray *locations;
    Location *loc;
    NSString *accessLevel;
}
/// Staff from the response
@property(nonatomic, strong) Staff *Staff;

@end
