//
//  ClassDescription.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 9/25/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceCategory.h"
#import "SessionType.h"
#import "Utils.h"
#import "MBConstants.h"
#import "DataMapper.h"
/*!
 @brief Represents a description for a class
 */
@interface ClassDescription :DataMapper
{
    NSString *lastUpdated;
}
/// Image URL
@property (nonatomic, strong) NSString *ImageURL;
/// ID
@property (nonatomic, strong) NSString *ID;
/// Name/Title
@property (nonatomic, strong) NSString *Name;
/// Description text
@property (nonatomic, strong) NSString *Description;
/// Prerequisite
@property (nonatomic, strong) NSString *Prereq;
/// Notes
@property (nonatomic, strong) NSString *Notes;
/// Last updated (site time)
@property (nonatomic, strong) NSDate *LastUpdated;
/// Service category
@property (nonatomic, strong) ServiceCategory *ServiceCategory;
/// Session type
@property (nonatomic, strong) SessionType *SessionType;

@end
