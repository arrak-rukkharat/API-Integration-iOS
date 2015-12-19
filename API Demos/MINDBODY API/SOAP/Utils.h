//
//  SOAPUtils.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/2/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ISO_DATE_TIME_FORMAT @"yyyy-MM-dd'T'HH:mm:ss"
#define ISO_DATE_FORMAT @"yyyy-MM-dd"
/*!
 A set of tools for various purposes
 */
@interface Utils : NSObject
/*!
 Convert a system date object to a string in the ISO format (yyyy-MM-ddTHH:mm:ss)
 @param date a system date
 */
+ (NSString*)convertDateToISO:(NSDate*)date;
/*!
 Convert a date string in the ISO format (yyyy-MM-ddTHH:mm:ss) to the system date object
 @param string a date string in the ISO formate
 */
+ (NSDate*)convertISOToDate:(NSString*)string;
/*!
 Concate the two strings. If the first string is nil, it will be empty and returns the second string.
 !!!: The second string cannot be nil
 @param string a date string in the ISO formate
 */
+ (NSString*)concate:(NSString*)orig :(NSString*)notNilString;
/*!
 Convert a system date object to a string in the given formate
 @param date a system date
 @param formate date string format
 */
+ (NSString*)dateToString:(NSDate*)date format:(NSString*)format;
/*!
 Convert a date string in the given formate to a system date
 @param string a date string in the ISO formate
 @param formate date string format
 */
+ (NSDate*)stringToDate:(NSString*)string format:(NSString*)format;

@end
