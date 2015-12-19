//
//  Site.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataMapper.h"
/*!
 @brief Represents a site or studio info
 */
@interface Site : DataMapper
/// A site ID unique to a business
@property (nonatomic, strong) NSString *ID;
/// The name of the site
@property (nonatomic, strong) NSString *Name;
/// Site description
@property (nonatomic, strong) NSString *DescriptionText;
/// The URL to the site logo
@property (nonatomic, strong) NSString *LogoURL;
/// Page color
@property (nonatomic, strong) NSString *PageColor1;
/// Page color
@property (nonatomic, strong) NSString *PageColor2;
/// Page color
@property (nonatomic, strong) NSString *PageColor3;
/// Page color
@property (nonatomic, strong) NSString *PageColor4;
/// Studio contact email address
@property (nonatomic, strong) NSString *ContactEmail;
/// The studio accepts Visa
@property (nonatomic, assign) BOOL AcceptsVisa;
/// The studio accepts Discover
@property (nonatomic, assign) BOOL AcceptsDiscover;
/// The studio accepts MasterCard
@property (nonatomic, assign) BOOL AcceptsMasterCard;
/// The studio accepts American Express
@property (nonatomic, assign) BOOL AcceptsAmericanExpress;

@end
