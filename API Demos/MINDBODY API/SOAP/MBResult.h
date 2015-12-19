//
//  MBResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 7/23/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Staff.h"
#include "Utils.h"
#import "Client.h"
#import "Location.h"
#import "Permission.h"
#import "Visit.h"
#import "ClientIndex.h"
#import "IndexValue.h"
#import "ServiceCategory.h"
#import "SessionType.h"
#import "PurchasedService.h"
#import "Sale.h"
#import "Payment.h"
#import "SaleItem.h"
#import "Service.h"
#import "Package.h"
#import "Product.h"
#import "CartItem.h"
#import "Receipt.h"
#import "ClientMembership.h"
#import "C1ass.h"
#import "ClassSchedule.h"
#import "Course.h"
#import "WaitlistEntry.h"
#import "Appointment.h"
#import "ScheduleItem.h"

/*!
 Represents a response from the server. This class is mainly responsible for parsing and object mapping from the XML/JSON response.
 Note: this class is to be inherited
 */
@interface MBResult : NSObject <NSXMLParserDelegate>
{
    // For xml parsing, keeping track of node
    NSString *element;
    NSString *parentElementName;
}
/// The response error code
@property (nonatomic, assign) int ErrorCode;
/// The response message or error description
@property (nonatomic, strong) NSString *Message;
/// The response status
@property (nonatomic, strong) NSString *Status;
/// The number of the results from the response
@property (nonatomic, assign) int ResultCount;
/*!
 Map XML data. To be overridden.
 @param data the XML data
 */
- (void)mapData:(NSData*)data;

@end
