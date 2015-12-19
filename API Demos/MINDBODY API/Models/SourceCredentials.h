//
//  SourceCredentials.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/24/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 @brief Represents a source credential for data access
 */
@interface SourceCredentials : NSObject
/// A source name unique for a business integrating with MINDBODY API
@property (nonatomic, strong) NSString *SourceName;
/// The password coresponding to the source name
@property (nonatomic, strong) NSString *Password;
/// The site/studio/subscriber ID that the source has access to
@property (nonatomic, strong) NSString *SiteID;

+ (id)sharedInstance;

@end
