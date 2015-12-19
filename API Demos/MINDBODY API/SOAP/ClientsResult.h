//
//  GetClientsResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/31/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Client.h"
#import "Location.h"
#import "MBResult.h"
@interface ClientsResult : MBResult
{
    Client *client;
    Location *loc;
    NSString *birthDateString;
    NSString *firstAppointmentDateString;
    NSMutableArray *additionalImageUrls;
    NSString *imageUrl;
}
/// Collection of Client
@property(nonatomic, strong) NSMutableArray *Clients;

@end
