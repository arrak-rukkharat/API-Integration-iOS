//
//  BuilderClientService.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/30/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "MBConstants.h"
#import "SourceCredentials.h"
#import "UserCredentials.h"
#import "Client.h"
#import "Utils.h"

@interface XMLClientService : NSObject
+ (NSURLRequest*)SOAPGetClients:(NSArray*)IDs :(NSString*)searchText :(DataDetail)detail :(int)limit;
+ (NSURLRequest*)SOAPAddClient:(Client*)client;
+ (NSURLRequest*)SOAPUpdateClient:(Client*)client clientID:(NSString*)ID;
+ (NSURLRequest*)SOAPUpdateClientCreditCard:(ClientCreditCard*)card clientID:(NSString*)ID;
+ (NSURLRequest*)SOAPGetClientCreditCard:(NSString*)clientID;
+ (NSURLRequest*)SOAPGetClientVisits:(NSString*)clientID startDate:(NSDate*)date;
+ (NSURLRequest*)SOAPGetClientAccountBalances:(NSString*)clientID;
+ (NSURLRequest*)SOAPGetRequiredClientFields;
+ (NSURLRequest*)SOAPGetClientIndexes;
+ (NSURLRequest*)SOAPGetClientSchedule:(NSString*)clientID endDate:(NSDate*)date;
+ (NSURLRequest*)SOAPValidateLogin:(NSString*)username password:(NSString*)password;
+ (NSURLRequest*)SOAPGetClientServices:(NSString*)clientID serviceCategoryIDs:(NSMutableArray*)serviceCategoryIDs classID:(NSString*)classID sessionTypeIDs:(NSMutableArray*)sessionTypeIDs startDate:(NSDate*)startDate endDate:(NSDate*)endDate;
+ (NSURLRequest*)SOAPGetClientReferralTypes;
+ (NSURLRequest*)SOAPGetClientPurchases:(NSString*)clientID startDate:(NSDate*)date endDate:(NSDate*)endDate;
+ (NSURLRequest*)SOAPGetClientMemberships:(NSString*)clientID byLocationIDOrNil:(NSString*)locationID;
@end
