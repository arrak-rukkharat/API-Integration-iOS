//
//  SitesResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"
#import "Site.h"

@interface SitesResult : MBResult
{
    Site *site;
}
/// Collection of Site
@property (nonatomic, strong) NSMutableArray *Sites;

@end
