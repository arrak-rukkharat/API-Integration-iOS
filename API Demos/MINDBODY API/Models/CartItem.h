//
//  CartItem.h
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/22/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CheckoutItem.h"

/*!
 A shopping cart item, containing a consumer item and assocaited quantity.
 */

@interface CartItem : DataMapper
{
    
}

/// The unique ID of the cart item
@property (nonatomic, strong) NSString *ID;
/// The consumer item associated with this cart item including a service, package, or product
@property (nonatomic, strong) CheckoutItem *Item;
/// The amount the item is discounted. This requires a staff credentails. This field will not work on packages.
@property (nonatomic, strong) NSString *DiscountAmount;
/// The list of Appointments that this item will attempt to pay for. (For services only)
@property (nonatomic, strong) NSMutableArray *Appointments;
/// The list of EnrollmentIDs that this item will attempt to pay for. (For services only)
@property (nonatomic, strong) NSMutableArray *EnrollmentIDs;
/// The list of ClassIDs that this item will attempt to pay for. (For services only)
@property (nonatomic, strong) NSMutableArray *ClassIDs;
/// The list of CourseIDs that this item will attempt to pay for. (For services only)
@property (nonatomic, strong) NSMutableArray *CourseIDs;
/// A list of VisitIDs that this item will attempt to pay for. (For services only)
@property (nonatomic, strong) NSMutableArray *VisitIDs;
/// A list of AppointmentIDs that this item will attempt to reconcile.
@property (nonatomic, strong) NSMutableArray *AppointmentIDs;
/// The number of consumer items contained within this cart item
@property (nonatomic, assign) int Quantity;

@end
