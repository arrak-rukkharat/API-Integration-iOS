//
//  ClassSchedulesResult.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/10/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface ClassSchedulesResult : MBResult
{
    Staff *staff;
    ClassSchedule *c;
    NSMutableArray *classSche;
    Location *loc;
    ServiceCategory *prg;
    ClassDescription *classDes;
    SessionType *sess;
    bool isEnrollments;
}
@property(nonatomic, strong) NSMutableArray *ClassSchedules;

@end
