//
//  PurchasesResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/12/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "MBResult.h"


@interface PurchasesResult : MBResult
{
    SaleItem *saleItem;
    Sale *sale;
    Payment *payment;
    NSMutableArray *purchases, *payments;
    Location *loc;
    
    
}
/// Collection of SaleItem
@property (nonatomic, strong) NSArray *Purchases;

@end
