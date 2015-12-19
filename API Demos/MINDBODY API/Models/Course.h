//
//  Course.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 10/14/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "DataMapper.h"
#import "ServiceCategory.h"
#import "Location.h"
#import "Staff.h"
/*!
 @brief Represents a series of unique classes
 */
@interface Course : DataMapper
{
    NSString *startDateString, *endDateString;
}
/// Name of the course.
@property (nonatomic, strong) NSString *Name;
/// ID of the Course.
@property (nonatomic, strong) NSString *ID;
/// Description of the course.
@property (nonatomic, strong) NSString *Description;
/// Notes of the course.
@property (nonatomic, strong) NSString *Notes;
/// The start date of the course. (site time)
@property (nonatomic, strong) NSDate *StartDate;
/// End date (site time)
@property (nonatomic, strong) NSDate *EndDate;
/// Location of the course.
@property (nonatomic, strong) Location *Location;
/// Service category / program of the course.
@property (nonatomic, strong) ServiceCategory *ServiceCategory;
/// Organizer/Staff of the course.
@property (nonatomic, strong) Staff *Organizer;

@end
