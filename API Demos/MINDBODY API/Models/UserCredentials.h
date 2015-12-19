//
//  UserCredentials.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/26/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
/*!
 @brief Represents user credentials that can be consumer, staff, or owner.
 */
@interface UserCredentials : NSObject
/// The user name
@property (nonatomic, strong) NSString *Username;
/// The password coresponding to the username
@property (nonatomic, strong) NSString *Password;
/// The site/studio/subscriber ID that the user has access to
@property (nonatomic, strong) NSString *SiteID;

+ (id)sharedInstance;

@end
