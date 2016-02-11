//
//  ClientService.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/30/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientService.h"

@implementation ClientService

+ (void)GetClientsByIDs:(NSArray*)IDs withBlock:(void (^)(ClientsResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClients:IDs :nil :DataDetailFull :0];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientsResult *result = [ClientsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)SearchClientsWithText:(NSString*)searchText resultLimit:(int)limit withBlock:(void (^)(ClientsResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClients:nil :searchText :DataDetailBasic :limit];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientsResult *result = [ClientsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)AddClient:(Client*)client withBlock:(void (^)(ClientResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPAddClient:client];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientResult *result = [ClientResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)UpdateClient:(Client*)client forClientID:(NSString*)ID withBlock:(void (^)(ClientResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPUpdateClient:client clientID:ID];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientResult *result = [ClientResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)UpdateClientCreditCard:(ClientCreditCard*)card forClientID:(NSString*)ID withBlock:(void (^)(ClientResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPUpdateClientCreditCard:card clientID:ID];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientResult *result = [ClientResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetStoredCreditCardWithClientID:(NSString*)clientID withBlock:(void (^)(CreditCardResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientCreditCard:clientID];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          CreditCardResult *result = [CreditCardResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetVisitHistoryWithClientID:(NSString*)clientID startDate:(NSDate*)date withBlock:(void (^)(VisitsResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientVisits:clientID startDate:date];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          VisitsResult *result = [VisitsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetAccountBalancesWithClientID:(NSString*)clientID withBlock:(void (^)(ClientAccountBalancesResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientAccountBalances:clientID];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientAccountBalancesResult *result = [ClientAccountBalancesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetRequiredClientFieldsWithBlock:(void (^)(RequiredClientFieldsResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetRequiredClientFields];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          RequiredClientFieldsResult *result = [RequiredClientFieldsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClientIndexesWithBlock:(void (^)(ClientIndexesResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientIndexes];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientIndexesResult *result = [ClientIndexesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClientScheduleWithClientID:(NSString*)clientID endDate:(NSDate*)date withBlock:(void (^)(VisitsResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientSchedule:clientID endDate:date];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          VisitsResult *result = [VisitsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClientScheduleForToday:(NSString*)clientID withBlock:(void (^)(VisitsResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientSchedule:clientID endDate:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          VisitsResult *result = [VisitsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClientServices:(NSString*)clientID startDate:(NSDate*)startDate endDate:(NSDate*)endDate withBlock:(void (^)(ClientServicesResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientServices:clientID serviceCategoryIDs:nil classID:nil sessionTypeIDs:nil startDate:startDate endDate:endDate];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientServicesResult *result = [ClientServicesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClientServicesWithClientID:(NSString*)clientID serviceCategoryIDs:(NSMutableArray*)serviceCategoryIDs startDate:(NSDate*)startDate endDate:(NSDate*)endDate withBlock:(void (^)(ClientServicesResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientServices:clientID serviceCategoryIDs:serviceCategoryIDs classID:nil sessionTypeIDs:nil startDate:startDate endDate:endDate];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientServicesResult *result = [ClientServicesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClientServicesWithClientID:(NSString*)clientID sessionTypeIDs:(NSMutableArray*)sessionTypeIDs startDate:(NSDate*)startDate endDate:(NSDate*)endDate withBlock:(void (^)(ClientServicesResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientServices:clientID serviceCategoryIDs:nil classID:nil sessionTypeIDs:sessionTypeIDs startDate:startDate endDate:endDate];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientServicesResult *result = [ClientServicesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClientServicesWithClientID:(NSString*)clientID classID:(NSString*)classID serviceCategoryIDs:(NSMutableArray*)serviceCategoryIDs startDate:(NSDate*)startDate endDate:(NSDate*)endDate withBlock:(void (^)(ClientServicesResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientServices:clientID serviceCategoryIDs:serviceCategoryIDs classID:classID sessionTypeIDs:nil startDate:startDate endDate:endDate];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientServicesResult *result = [ClientServicesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClientServices:(NSString*)clientID serviceCategoryIDs:(NSMutableArray*)serviceCategoryIDs withBlock:(void (^)(ClientServicesResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientServices:clientID serviceCategoryIDs:serviceCategoryIDs classID:nil sessionTypeIDs:nil startDate:nil endDate:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientServicesResult *result = [ClientServicesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClientServicesWithClientID:(NSString*)clientID withBlock:(void (^)(ClientServicesResult* result))block
{
    [SiteService GetServiceCategoriesTypeAllWithBlock:^(ServiceCategoriesResult *result)
     {
         NSMutableArray *serviceCategoryIDs = [NSMutableArray new];
         for (ServiceCategory *obj in result.Programs)
         {
             [serviceCategoryIDs addObject:obj.ID];
         }
         NSDate *start = [Utils convertISOToDate:@"2010-01-01T00:00:00"];
         NSDate *end = [Utils convertISOToDate:@"2030-01-01T00:00:00"];
         NSURLRequest *request = [XMLClientService SOAPGetClientServices:clientID serviceCategoryIDs:serviceCategoryIDs classID:nil sessionTypeIDs:nil startDate:start endDate:end];
         NSURLSession *session = [NSURLSession sharedSession];
         [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
           {
               ClientServicesResult *result = [ClientServicesResult new];
               [result mapData:data];
               
               block(result);
           }] resume];
     }];
}

+ (void)GetClientServicesWithClientID:(NSString*)clientID sessionTypeIDs:(NSMutableArray*)sessionTypeIDs withBlock:(void (^)(ClientServicesResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientServices:clientID serviceCategoryIDs:nil classID:nil sessionTypeIDs:sessionTypeIDs startDate:nil endDate:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientServicesResult *result = [ClientServicesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClientServices:(NSString*)clientID classID:(NSString*)classID withBlock:(void (^)(ClientServicesResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientServices:clientID serviceCategoryIDs:nil classID:classID sessionTypeIDs:nil startDate:nil endDate:nil];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientServicesResult *result = [ClientServicesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClientReferralTypesWithBlock:(void (^)(ClientReferralTypesResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientReferralTypes];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientReferralTypesResult *result = [ClientReferralTypesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)ValidateLoginWithUsername:(NSString*)username password:(NSString*)password withBlock:(void (^)(ClientResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPValidateLogin:username password:password];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientResult *result = [ClientResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClientPurchasesWithClientID:(NSString*)clientID startDate:(NSDate*)startDate endDate:(NSDate*)endDate withBlock:(void (^)(PurchasesResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientPurchases:clientID startDate:startDate endDate:endDate];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          PurchasesResult *result = [PurchasesResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

+ (void)GetClientMembershipsWithClientID:(NSString*)clientID byLocationIDOrNil:(NSString*)locationID withBlock:(void (^)(ClientMembershipsResult* result))block
{
    NSURLRequest *request = [XMLClientService SOAPGetClientMemberships:clientID byLocationIDOrNil:locationID];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          ClientMembershipsResult *result = [ClientMembershipsResult new];
          [result mapData:data];
          block(result);
      }] resume];
}

@end
