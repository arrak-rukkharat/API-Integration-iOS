//
//  SourceCredentials.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/24/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "SourceCredentials.h"



@implementation SourceCredentials

@synthesize SourceName;
@synthesize Password;
@synthesize SiteID;


+ (id)sharedInstance
{
    static SourceCredentials *sharedInstance = nil;
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
