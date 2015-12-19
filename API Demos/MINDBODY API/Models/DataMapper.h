//
//  DataMapper.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 9/26/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"
/*!
 @brief Supper class of all models
 */
@interface DataMapper : NSObject

- (void)mapElement:(NSString*)element with:(NSString*)string;
- (void)finish;

@end
