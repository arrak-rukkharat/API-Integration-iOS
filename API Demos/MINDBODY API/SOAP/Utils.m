//
//  SOAPUtils.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/2/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSString*)convertDateToISO:(NSDate*)date
{
    // Convert NSDate to string
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:ISO_DATE_TIME_FORMAT];
    [df setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    return [df stringFromDate:date];
}

+ (NSString*)dateToString:(NSDate*)date format:(NSString*)format
{
    // Convert NSDate to string
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:format];
    [df setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    return [df stringFromDate:date];
}

+ (NSDate*)stringToDate:(NSString*)string format:(NSString*)format
{
    // Convert NSDate to string
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:format];
    [df setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    return [df dateFromString:string];
}

+ (NSDate*)convertISOToDate:(NSString*)string
{
    // Convert string to NSDate
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:ISO_DATE_TIME_FORMAT];
    [df setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    return [df dateFromString:string];
}

+ (NSString*)concate:(NSString*)orig :(NSString*)notNilString
{
    return orig == nil ? notNilString : [NSString stringWithFormat:@"%@%@", orig, notNilString];
}

@end
