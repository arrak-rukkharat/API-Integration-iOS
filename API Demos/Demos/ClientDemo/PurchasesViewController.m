//
//  PurchasesViewController.m
//  API Demos
//
//  Created by Arrak Rukkharat on 11/25/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "PurchasesViewController.h"
#import "MBAPI.h"

@interface PurchasesViewController ()

@end

@implementation PurchasesViewController

- (id)initWithClientID:(NSString*)clientID
{
    if (self = [super init])
    {
        [self setTitle:@"Purchases"];
        
        list = [[NSArray alloc] init];
        self.tableView.allowsSelection = NO;
        // Results from today to 2020
        NSDate *start = [Utils convertISOToDate:@"2010-01-01T00:00:00"];
        NSDate *end = [Utils convertISOToDate:@"2020-01-01T00:00:00"];
        
        [ClientService GetClientPurchases:clientID startDate:start endDate:end withBlock:^(PurchasesResult *result)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (result.ErrorCode == 200)
                {
                    list = result.Purchases;
                    noItemText = @"No purchased items";
                    [self.tableView reloadData];
                }
            });
        }];
        
        self.navigationItem.leftBarButtonItem.title = @"";
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (list.count == 0)
    {
        return 1;
    }
    
    return list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    if (list.count == 0)
    {
        cell.textLabel.text = indexPath.row == 0 ? noItemText : nil;
    }
    else
    {
        SaleItem *item = (SaleItem*)[list objectAtIndex:indexPath.row];
        NSString *saleDate = @"";
        if (item.Sale)
        {
            NSString *dateString = [Utils dateToString:item.Sale.SaleDate format:@"MMMM dd, yyyy"];
            saleDate = [NSString stringWithFormat:@" on %@", dateString];
        }
        
        cell.textLabel.text = item.DescriptionText;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Price $%@%@", item.Price, saleDate];
        cell.detailTextLabel.textColor = [UIColor grayColor];
    }
    return cell;
}

@end
