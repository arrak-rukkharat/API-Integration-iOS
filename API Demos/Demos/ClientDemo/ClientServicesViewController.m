//
//  ClientServicesViewController.m
//  API Demos
//
//  Created by Arrak Rukkharat on 11/25/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientServicesViewController.h"
#import "MBAPI.h"

@interface ClientServicesViewController ()

@end

@implementation ClientServicesViewController

- (id)initWithClientID:(NSString*)clientID
{
    if (self = [super init])
    {
        [self setTitle:@"Services"];
        
        services = [[NSArray alloc] init];
        memberships = [[NSArray alloc] init];
        self.tableView.allowsSelection = NO;
        [SiteService GetServiceCategoriesTypeAllWithBlock:^(ServiceCategoriesResult *result)
         {
             [self loadServices:result.Programs :clientID];
         }];

    }
    return self;
}

- (void)loadServices:(NSMutableArray*)programs :(NSString*)clientID
{
    // Get client's passes
    NSMutableArray *programIDs = [NSMutableArray new];
    for (ServiceCategory *obj in programs)
    {
        [programIDs addObject:obj.ID];
    }
    
    // Results from today to 2020
    NSDate *start = [Utils convertISOToDate:@"2010-01-01T00:00:00"];
    NSDate *end = [Utils convertISOToDate:@"2020-01-01T00:00:00"];
    
    [ClientService GetClientServices:clientID serviceCategoryIDs:programIDs startDate:start endDate:end withBlock:^(ClientServicesResult *result)
     {
         dispatch_async(dispatch_get_main_queue(), ^{
             if (result.ErrorCode == 200)
             {
                 services = (NSArray*)result.Services;
                 [self.tableView reloadData];
             }
         });
     }];
    
    // Get client's memberships
    [ClientService GetClientMemberships:clientID byLocationIDOrNil:nil withBlock:^(ClientMembershipsResult *result)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (result.ErrorCode == 200)
            {
                memberships = (NSArray*)result.ClientMemberships;
                [self.tableView reloadData];
            }
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return memberships.count;
    }
    else
    {
        return services.count;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return [NSString stringWithFormat:@"Active Memberships (%d)", memberships.count];
    }
    else
    {
        return [NSString stringWithFormat:@"Passes (%d)", services.count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    
    NSArray *array;
    
    if (indexPath.section == 0)
    {
        array = memberships;
    }
    else
    {
        array = services;
    }

    Service *item = (Service*)[array objectAtIndex:indexPath.row];
    cell.textLabel.text = item.Name;
    
    NSString *active = [Utils dateToString:item.ActiveDate format:@"yyyy/MM/dd"];
    NSString *expired = [Utils dateToString:item.ExpirationDate format:@"yyyy/MM/dd"];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", active, expired];
    cell.detailTextLabel.textColor = [UIColor grayColor];
    
    return cell;
}

@end
