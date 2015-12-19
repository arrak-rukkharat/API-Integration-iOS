//
//  ClientReferralTypesResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/11/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"
/*!
 Represents a client referral type response from the server.
 */
@interface ClientReferralTypesResult : MBResult
{
    NSMutableArray *types;
    NSString *name;
}
/// Collection of NSString. Each element represents a referral type used when signing up a new client in consumer mode
@property(nonatomic, strong) NSArray *ReferralTypes;

@end
