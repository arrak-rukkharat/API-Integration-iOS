//
//  CoursesResult.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/14/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface CoursesResult : MBResult
{
    Staff *staff;
    Course *c;
    NSMutableArray *courses;
    Location *loc;
    ServiceCategory *prg;
    ClassDescription *classDes;
    Client *client;
}

@property (nonatomic, strong) NSArray *Courses;

@end
