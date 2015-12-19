//
//  ClassViewController.m
//  API Demos
//
//  Created by Arrak Rukkharat on 12/1/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "BookablesViewController.h"
#import "ApptCheckoutViewController.h"
#import "MBAPI.h"

@implementation BookablesViewController

- (id)initWithClientIDOrNil:(NSString*)clientIDForBooking sessiontypeID:(NSString*)sessionID sessionTitle:(NSString*)title pageTitle:(NSString*)pageTitle
{
    if (self = [super init])
    {
        clientID = clientIDForBooking;
        headerTitle = title;
        [self setTitle:pageTitle];
        progressDialog = [[UIAlertView alloc] init];
        progressDialog.message = @"Loading...";
        sessionTypeIDs = [NSMutableArray new];
        [sessionTypeIDs addObject:sessionID];
        [self loadToday];
        [self.navigationItem.backBarButtonItem setTitle:@""];
    }
    return self;
}

- (void)loadToday
{
    startDate = [NSDate date];
    endDate = [NSDate dateWithTimeInterval:TENDAY_INCREMENT sinceDate:startDate];
    
    [progressDialog show];
    [AppointmentService GetBookablesBySessionTypeIDs:sessionTypeIDs startDate:startDate endDate:endDate withBlock:^(ScheduleItemsResult *result)
     {
         dispatch_async(dispatch_get_main_queue(), ^{
             
             [progressDialog dismissWithClickedButtonIndex:0 animated:YES];
             
             if (result.ErrorCode == 200)
             {
                 sessions = result.ScheduleItems;
                 [self.tableView reloadData];
             }
         });
     }];
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
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return headerTitle;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (sessions.count == 0)
    {
        return 1;
    }
    return sessions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    if (sessions.count > 0)
    {
        ScheduleItem *class = [sessions objectAtIndex:indexPath.row];
        NSString *dateString = [Utils dateToString:class.StartDateTime format:@"MMMM dd, yyyy - hh:mm a"];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Staff: %@ %@", class.Staff.FirstName, class.Staff.LastName];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", dateString];
        cell.detailTextLabel.textColor = [UIColor grayColor];
    }
    else
    {
        cell.textLabel.text = @"No schedule available";
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Tab the class for booking
    if (clientID)
    {
        ScheduleItem *schedule = [sessions objectAtIndex:indexPath.row];
        ApptCheckoutViewController *t = [[ApptCheckoutViewController alloc] initWithSessionTypeID:schedule.SessionType.ID ClientID:clientID schduleItem:schedule];
        [self.navigationController pushViewController:t animated:YES];
    }
}

@end
