//
//  LocationListResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBResult.h"
@interface LocationsResult : MBResult
{
    Location *loc;
    NSString *imageUrl;
}
/// Collection of Location
@property(nonatomic, strong) NSMutableArray *Locations;
@end
