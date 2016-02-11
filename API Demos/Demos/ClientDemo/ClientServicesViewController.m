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
        activeServices = [[NSMutableArray alloc] init];
        
        self.tableView.allowsSelection = NO;
        
        [self loadServices:clientID];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *btShowAll = [[UIBarButtonItem alloc] initWithTitle:@"All" style:UIBarButtonItemStylePlain target:self action:@selector(showAllServices)];
    UIBarButtonItem *btShowActive = [[UIBarButtonItem alloc] initWithTitle:@"Active Only" style:UIBarButtonItemStylePlain target:self action:@selector(showActiveServices)];
    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects: btShowActive, btShowAll, nil];
}

- (void)showActiveServices
{
    showActiveOnly = YES;
    services = activeServices;
    [self.tableView reloadData];
}

- (void)showAllServices
{
    showActiveOnly = NO;
    services = allServices;
    [self.tableView reloadData];
}

- (void)loadServices:(NSString*)clientID
{
    // Get client's purchased services
    [ClientService GetClientServicesWithClientID:clientID withBlock:^(ClientServicesResult *result)
     {
         dispatch_async(dispatch_get_main_queue(), ^{
             if (result.ErrorCode == 200)
             {
                 allServices = (NSArray*)result.Services;
                 for (Service *item in allServices)
                 {
                     if (item.Current)
                     {
                         [activeServices addObject:item];
                     }
                 }
                 [self showAllServices];
             }
         });
     }];
    
    // Get client's memberships
    [ClientService GetClientMembershipsWithClientID:clientID byLocationIDOrNil:nil withBlock:^(ClientMembershipsResult *result)
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
