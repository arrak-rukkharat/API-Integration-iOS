//
//  AddClientResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/1/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBResult.h"

@interface ClientResult : MBResult
{
    Client *client;
    Location *loc;
    NSString *birthDateString;
    NSString *firstAppointmentDateString;
    NSMutableArray *additionalImageUrls;
    NSString *imageUrl;
}
/// The client from the response
@property (nonatomic, strong) Client *Client;


@end
