//
//  ClientService.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/30/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLClientService.h"
#import "MBResponseObjects.h"
#import "SiteService.h"

/*!
 Contains a group of methods that are mainly responsible for adding and updating clients and their information including the basic information, indexes, account details, visit history, and schedule
 */
@interface ClientService : NSObject
/*!
 Get a list of clients for the given client IDs (NSString)
 */
+ (void)GetClientsByIDs:(NSArray*)IDs withBlock:(void (^)(ClientsResult* result))block;

/*!
 Search clients based on the first and last name and client ID and then returns the list of relevent clients.
 @param searchText a search text
 */
+ (void)SearchClientsWithText:(NSString*)searchText resultLimit:(int)limit withBlock:(void (^)(ClientsResult* result))block;

/*!
 Add a new client to the system. The client information has to meet the client required fields for consumer mode.
 For more info, see GetRequiredClientFieldsWithBlock. In business mode, the process can bypass the required fields by providing 
 only a first name and a last name in the client object and the staff credentials in the UserCredentials.
 */
+ (void)AddClient:(Client*)client withBlock:(void (^)(ClientResult* result))block;

/*!
 Update client information. The client information has to meet the client required fields for consumer mode.
 For more info, see GetRequiredClientFieldsWithBlock. In business mode, the updating process can bypass the required fields by  providing the staff credentials in the UserCredentials.
 */
+ (void)UpdateClient:(Client*)client forClientID:(NSString*)ID withBlock:(void (^)(ClientResult* result))block;

/*!
 Update client's credit card information. This requires staff credentials.
 */
+ (void)UpdateClientCreditCard:(ClientCreditCard*)card forClientID:(NSString*)ID withBlock:(void (^)(ClientResult* result))block;

/*!
 Retrive client's credit card information. This requires the user credentials.
 */
+ (void)GetStoredCreditCardWithClientID:(NSString*)clientID withBlock:(void (^)(CreditCardResult* result))block;

/*!
 Retrive client's visit history including classes and appointments form a specific date to today. This requires the user credentials.
 */
+ (void)GetVisitHistoryWithClientID:(NSString*)clientID startDate:(NSDate*)date withBlock:(void (^)(VisitsResult* result))block;

/*!
 Retrive client's visit history including classes and appointments form a specific date to today. This requires the user credentials.
 */
+ (void)GetAccountBalancesWithClientID:(NSString*)clientID withBlock:(void (^)(ClientAccountBalancesResult* result))block;

/*!
 Retrive client the field names that the client has to provide information for signing up for as a new client.
 */
+ (void)GetRequiredClientFieldsWithBlock:(void (^)(RequiredClientFieldsResult* result))block;

/*!
 Retrive client indexes or information options
 */
+ (void)GetClientIndexesWithBlock:(void (^)(ClientIndexesResult* result))block;

/*!
 Retrive client's visit history including classes and appointments form a specific date to today. This requires the user credentials.
 */
+ (void)GetClientScheduleWithClientID:(NSString*)clientID endDate:(NSDate*)date withBlock:(void (^)(VisitsResult* result))block;

/*!
 Retrive client's today's schedule.
 */
+ (void)GetClientScheduleForToday:(NSString*)clientID withBlock:(void (^)(VisitsResult* result))block;

/*!
 Retrive client's purchased services or passes
 */
+ (void)GetClientServicesWithClientID:(NSString*)clientID serviceCategoryIDs:(NSMutableArray*)serviceCategoryIDs startDate:(NSDate*)startDate endDate:(NSDate*)endDate withBlock:(void (^)(ClientServicesResult* result))block;

/*!
 Retrive client's purchased services or passes
 */
+ (void)GetClientServicesWithClientID:(NSString*)clientID classID:(NSString*)classID serviceCategoryIDs:(NSMutableArray*)serviceCategoryIDs startDate:(NSDate*)startDate endDate:(NSDate*)endDate withBlock:(void (^)(ClientServicesResult* result))block;

/*!
 Retrive client's purchased services or passes
 */
+ (void)GetClientServicesWithClientID:(NSString*)clientID sessionTypeIDs:(NSMutableArray*)sessionTypeIDs startDate:(NSDate*)startDate endDate:(NSDate*)endDate withBlock:(void (^)(ClientServicesResult* result))block;

/*!
 Retrive all purchased services for a client. The result include inactive services.
 */
+ (void)GetClientServicesWithClientID:(NSString*)clientID withBlock:(void (^)(ClientServicesResult* result))block;

/*!
 Retrive client's purchased services or passes
 */
+ (void)GetClientServicesWithClientID:(NSString*)clientID sessionTypeIDs:(NSMutableArray*)sessionTypeIDs withBlock:(void (^)(ClientServicesResult* result))block;

/*!
 Retrive client referal types
 */
+ (void)GetClientReferralTypesWithBlock:(void (^)(ClientReferralTypesResult* result))block;

/*!
 Validate client credentials against specific site/studio IDs
 */
+ (void)ValidateLoginWithUsername:(NSString*)username password:(NSString*)password withBlock:(void (^)(ClientResult* result))block;

/*!
 Retrive a client's purchase history
 */
+ (void)GetClientPurchasesWithClientID:(NSString*)clientID startDate:(NSDate*)startDate endDate:(NSDate*)endDate withBlock:(void (^)(PurchasesResult* result))block;

/*!
 Retrive client memberships. If location ID is specified, the result get filtered down to the specific location.
 */
+ (void)GetClientMembershipsWithClientID:(NSString*)clientID byLocationIDOrNil:(NSString*)locationID withBlock:(void (^)(ClientMembershipsResult* result))block;

@end