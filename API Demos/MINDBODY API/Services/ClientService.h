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


/*!
 Contains a group of methods that are mainly responsible for adding and updating clients and their information including the basic information, indexes, account details, visit history, and schedule
 */
@interface ClientService : NSObject
/*!
 Get a list of clients for the given client IDs
 @param IDs array of NSString
 */
+ (void)GetClients:(NSArray*)IDs withBlock:(void (^)(ClientsResult* result))block;

/*!
 Search clients based on the first and last name and client ID and then returns the list of relevent clients.
 @param searchText a search text
 */
+ (void)SearchClients:(NSString*)searchText resultLimit:(int)limit withBlock:(void (^)(ClientsResult* result))block;

/*!
 Add a new client to the system. The client information has to meet the client required fields for consumer mode.
 For more info, see GetRequiredClientFieldsWithBlock. In business mode, the process can bypass the required fields by providing 
 only a first name and a last name in the client object and the staff credentials in the UserCredentials.
 @param client a client object with at least first and last name and the required fields for adding a client in consumer mode
 */
+ (void)AddClient:(Client*)client withBlock:(void (^)(ClientResult* result))block;

/*!
 Update client information. The client information has to meet the client required fields for consumer mode.
 For more info, see GetRequiredClientFieldsWithBlock. In business mode, the updating process can bypass the required fields by  providing the staff credentials in the UserCredentials.
 @param client a client object with required fields for updating client information in consumer mode. In business mode, the credentials has to be provided in the request
 @param ID the client ID corresponding to the client object
 */
+ (void)UpdateClient:(Client*)client clientID:(NSString*)ID withBlock:(void (^)(ClientResult* result))block;

/*!
 Update client's credit card information. This requires staff credentials.
 @param card a card object
 @param ID the client ID for the credit card
 */
+ (void)UpdateClientCreditCard:(ClientCreditCard*)card clientID:(NSString*)ID withBlock:(void (^)(ClientResult* result))block;

/*!
 Retrive client's credit card information. This requires the user credentials.
 @param ID the client ID for the credit card
 */
+ (void)GetClientCreditCard:(NSString*)clientID withBlock:(void (^)(CreditCardResult* result))block;

/*!
 Retrive client's visit history including classes and appointments form a specific date to today. This requires the user credentials.
 @param clientID the client ID
 @param date the start date of the visits
 */
+ (void)GetClientVisitHistory:(NSString*)clientID startDate:(NSDate*)date withBlock:(void (^)(VisitsResult* result))block;

/*!
 Retrive client's visit history including classes and appointments form a specific date to today. This requires the user credentials.
 @param clientID the client ID
 @param date the start date of the visits
 */
+ (void)GetClientAccountBalances:(NSString*)clientID withBlock:(void (^)(ClientAccountBalancesResult* result))block;

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
 @param clientID the client ID
 @param date the end date of the visits
 */
+ (void)GetClientSchedule:(NSString*)clientID endDate:(NSDate*)date withBlock:(void (^)(VisitsResult* result))block;

/*!
 Retrive client's today's schedule.
 @param clientID the client ID
 */
+ (void)GetClientScheduleForToday:(NSString*)clientID withBlock:(void (^)(VisitsResult* result))block;

/*!
 Retrive client's purchased services or passes
 @param clientID the client ID
 @param serviceCategoryIDs filter by a list of service category or program IDs (NSString)
 @param startDate start date
 @param endDate end date
 */
+ (void)GetClientServices:(NSString*)clientID serviceCategoryIDs:(NSMutableArray*)serviceCategoryIDs startDate:(NSDate*)startDate endDate:(NSDate*)endDate withBlock:(void (^)(ClientServicesResult* result))block;

/*!
 Retrive client's purchased services or passes
 @param clientID the client ID
 @param sessionTypeIDs filter by a list of of session type IDs (NSString)
 @param startDate start date
 @param endDate end date
 */
+ (void)GetClientServices:(NSString*)clientID sessionTypeIDs:(NSMutableArray*)sessionTypeIDs startDate:(NSDate*)startDate endDate:(NSDate*)endDate withBlock:(void (^)(ClientServicesResult* result))block;


+ (void)GetClientServices:(NSString*)clientID classID:(NSString*)classID serviceCategoryIDs:(NSMutableArray*)serviceCategoryIDs startDate:(NSDate*)startDate endDate:(NSDate*)endDate withBlock:(void (^)(ClientServicesResult* result))block;

/*!
 Retrive client's purchased services or passes
 @param clientID the client ID
 @param sessionTypeIDs filter by a list of of session type IDs (NSString)
 */
+ (void)GetClientServices:(NSString*)clientID sessionTypeIDs:(NSMutableArray*)sessionTypeIDs withBlock:(void (^)(ClientServicesResult* result))block;

/*!
 Retrive client referal types
 */
+ (void)GetClientReferralTypesWithBlock:(void (^)(ClientReferralTypesResult* result))block;

/*!
 Validate client credentials against specific site/studio IDs
 @param username the username
 @param password the password corresponding to the username
 */
+ (void)ValidateLogin:(NSString*)username password:(NSString*)password withBlock:(void (^)(ClientResult* result))block;

/*!
 Retrive a client's purchase history
 @param clientID the client ID
 @param startDate start date
 @param endDate end date
 */
+ (void)GetClientPurchases:(NSString*)clientID startDate:(NSDate*)startDate endDate:(NSDate*)endDate withBlock:(void (^)(PurchasesResult* result))block;

/*!
 Retrive client memberships
 @param clientID the client ID
 @param locationID the location ID to filter
 */
+ (void)GetClientMemberships:(NSString*)clientID byLocationIDOrNil:(NSString*)locationID withBlock:(void (^)(ClientMembershipsResult* result))block;

@end