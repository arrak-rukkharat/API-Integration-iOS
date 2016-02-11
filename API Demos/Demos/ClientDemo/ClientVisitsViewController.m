//
//  ClientVisitsViewController.m
//  API Demos
//
//  Created by Arrak Rukkharat on 11/25/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientVisitsViewController.h"
#import "MBAPI.h"

@interface ClientVisitsViewController ()

@end

@implementation ClientVisitsViewController

- (id)initWithClientID:(NSString*)clientID
{
    if (self = [super init])
    {
        [self setTitle:@"Visit History"];
        
        list = [[NSArray alloc] init];
        self.tableView.allowsSelection = NO;
        // Results from 2010
        NSDate *start = [Utils convertISOToDate:@"2010-01-01T00:00:00"];
        [ClientService GetVisitHistoryWithClientID:clientID startDate:start withBlock:^(VisitsResult *result)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 if (result.ErrorCode == 200)
                 {
                     list = result.Visits;
                     noItemText = @"No past visits";
                     [self.tableView reloadData];
                 }
             });
         }];
        
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
        cell.textLabel.text = indexPath.row == 0 ? noItemText: nil;
    }
    else
    {
        Visit *visit = (Visit*)[list objectAtIndex:indexPath.row];
        NSString *dateString = [Utils dateToString:visit.StartDateTime format:@"yyyy/MM/dd - hh:mm a"];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", visit.Name];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", dateString];
        cell.detailTextLabel.textColor = [UIColor grayColor];
    }
    return cell;
}
@end
