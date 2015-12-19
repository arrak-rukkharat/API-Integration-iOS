//
//  GetClientAccountBalancesResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/5/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Client.h"
#import "MBResult.h"

/*!
 Represents a client account balances response from the server.
 */
@interface ClientAccountBalancesResult : MBResult
{
    Client *client;
}
/// The client's account balance in USD
@property (nonatomic, strong) NSString *AccountBalance;
/// The coresponding client
@property (nonatomic, strong) Client *Client;

@end
