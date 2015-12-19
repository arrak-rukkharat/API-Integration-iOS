//
//  MBAPI
//
//  Created by Arrak Rukkharat on 8/20/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "Product.h"

@implementation Product

- (void)mapElement:(NSString *)element with:(NSString *)string
{
    if ([element isEqualToString:@"ID"])
    {
        self.ID = [Utils concate:self.ID :string];
    }
    else if ([element isEqualToString:@"TaxRate"])
    {
        self.TaxRate = [Utils concate:self.TaxRate :string];
    }
    else if ([element isEqualToString:@"TaxIncluded"])
    {
        self.TaxIncluded = [Utils concate:self.TaxIncluded :string];
    }
    else if ([element isEqualToString:@"GroupID"])
    {
        self.GroupID = [Utils concate:self.GroupID :string];
    }
    else if ([element isEqualToString:@"Name"])
    {
        self.Name = [Utils concate:self.Name :string];
    }
    else if ([element isEqualToString:@"Price"])
    {
        self.Price = [Utils concate:self.Price :string];
    }
    else if ([element isEqualToString:@"OnlinePrice"])
    {
        self.OnlinePrice = [Utils concate:self.OnlinePrice :string];
    }
    else if ([element isEqualToString:@"ColorID"])
    {
        self.ColorID = [Utils concate:self.ColorID :string];
    }
    else if ([element isEqualToString:@"ColorName"])
    {
        self.ColorName = [Utils concate:self.ColorName :string];
    }
    else if ([element isEqualToString:@"SizeID"])
    {
        self.SizeID = [Utils concate:self.SizeID :string];
    }
    else if ([element isEqualToString:@"SizeName"])
    {
        self.SizeName = [Utils concate:self.SizeName :string];
    }
}

- (void)finish
{
    
}

@end
