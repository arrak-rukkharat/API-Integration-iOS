//
//  ProgramListResult.h
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/8/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBResult.h"

@interface ServiceCategoriesResult : MBResult
{
    ServiceCategory *prg;
}
/// Collection of Program (service category)
@property(nonatomic, strong) NSMutableArray *Programs;
@end
