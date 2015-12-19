//
//  UserCredentials.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/26/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "UserCredentials.h"

@implementation UserCredentials
@synthesize Username;
@synthesize Password;
@synthesize SiteID;


+ (id)sharedInstance
{
    static UserCredentials *sharedInstance = nil;
    @synchronized(self)
    {
        if (sharedInstance == nil)
        {
            sharedInstance = [[self alloc] init];
        }
    }
    return sharedInstance;
}

- (id)init
{
    if (self = [super init])
    {
        
    }
    return self;
}
@end
