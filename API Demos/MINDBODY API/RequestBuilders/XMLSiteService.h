//
//  BuilderSiteService.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "MBConstants.h"
#import "SourceCredentials.h"
#import "UserCredentials.h"
#import "Client.h"
#import "Utils.h"

@interface XMLSiteService : NSObject

+ (NSURLRequest*)SOAPGetSites:(NSString*)SiteID filter:(NSString*)searchText;
+ (NSURLRequest*)SOAPGetLocations;
+ (NSURLRequest*)SOAPGetServiceCategories:(NSString*)type;
+ (NSURLRequest*)SOAPGetSessionTypes:(NSMutableArray*)progIDs;

@end
