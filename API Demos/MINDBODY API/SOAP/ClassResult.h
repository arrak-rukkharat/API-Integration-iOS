//
//  ClassResult.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/9/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"

@interface ClassResult : MBResult
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

@property (nonatomic, strong) C1ass *Class;

@end
