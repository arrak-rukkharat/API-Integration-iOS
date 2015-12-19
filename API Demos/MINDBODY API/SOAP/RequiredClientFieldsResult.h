//
//  GetRequiredClientFieldsResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/5/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBResult.h"

@interface RequiredClientFieldsResult : MBResult
{
    NSString *fieldName;
}
/// Collection of NSString. Each element is the field that the new client has to provide. Signing up a new client can bypass the fields by providing the staff credentials.
@property (nonatomic, strong) NSMutableArray *RequiredFields;

@end
