//
//  IndexValue.m
//  MBSOAP
//
//  Created by Arrak Rukkharat on 8/6/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "IndexValue.h"

@implementation IndexValue
- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"Name"])
    {
        self.Name = [Utils concate:self.Name :string];
    }
}
@end
