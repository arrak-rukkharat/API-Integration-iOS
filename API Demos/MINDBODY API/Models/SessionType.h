//
//  SessionType.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataMapper.h"
/*!
 @brief Represents a type of session
 */
@interface SessionType : DataMapper
/// Default time length for this session type in seconds
@property (nonatomic, assign) int DefaultTimeLength;
/// The service category ID
@property (nonatomic, strong) NSString *ServiceCategoryID;
/// Number deducted
@property (nonatomic, assign) int NumDeducted;
/// The sesstion type ID
@property (nonatomic, strong) NSString *ID;
/// The session type's name
@property (nonatomic, strong) NSString *Name;

@end
