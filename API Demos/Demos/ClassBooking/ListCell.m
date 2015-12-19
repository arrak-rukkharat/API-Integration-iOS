//
//  SPTCell.m
//  SampleListApp
//
//  Created by Arrak Rukkharat on 5/25/14.
//  Copyright (c) 2014 Kanya. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell

@synthesize delegate = _delegate;
@synthesize title = _title;
@synthesize subtitle = _subtitle;
@synthesize lbCapacity = _lbCapacity;
@synthesize pvCapacity = _pvCapacity;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

+ (ListCell*)cellFromNibNamed:(NSString *)nibName
{
    
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    ListCell *xibBasedCell = nil;
    NSObject* nibItem = nil;
    
    while ((nibItem = [nibEnumerator nextObject]) != nil)
    {
        if ([nibItem isKindOfClass:[ListCell class]])
        {
            xibBasedCell = (ListCell *)nibItem;
            break; // we have a winner
        }
    }
    
    return xibBasedCell;
}

-(NSString *) reuseIdentifier
{
    return @"ListCellId";
}

@end
