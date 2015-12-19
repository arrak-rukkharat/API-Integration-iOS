//
//  ClassesResult.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 9/25/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface ClassesResult : MBResult
{
    Staff *staff;
    C1ass *c;
    NSMutableArray *classes;
    Location *loc;
    ServiceCategory *prg;
    ClassDescription *classDes;
    SessionType *sess;
    Client *client;
}

@property (nonatomic, strong) NSArray *Classes;

@end
