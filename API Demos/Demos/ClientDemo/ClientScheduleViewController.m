//
//  ClientScheduleViewController.m
//  API Demos
//
//  Created by Arrak Rukkharat on 11/25/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ClientScheduleViewController.h"
#import "ScheduleDetailViewController.h"
#import "MBAPI.h"

@interface ClientScheduleViewController ()

@end

@implementation ClientScheduleViewController

- (id)initWithClientID:(NSString*)clientID
{
    if (self = [super init])
    {
        [self setTitle:@"Schedule"];
        
        list = [[NSArray alloc] init];
        // Results from today to 2020
        NSDate *end = [Utils convertISOToDate:@"2020-01-01T00:00:00"];
        
        [ClientService GetClientScheduleWithClientID:clientID endDate:end withBlock:^(VisitsResult *result)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 if (result.ErrorCode == 200)
                 {
                     list = result.Visits;
                     noItemText = @"No schedule";
                     [self.tableView reloadData];
                 }
             });
         }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
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
        Visit *visit = (Visit*)[list objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", visit.Name];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Visit *visit = (Visit*)[list objectAtIndex:indexPath.row];
    
    ScheduleDetailViewController *t = [[ScheduleDetailViewController alloc] initWithVisit:visit];
    [self.navigationController pushViewController:t animated:YES];
}

@end
