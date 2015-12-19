//
//  SessionsViewController.m
//  API Demos
//
//  Created by Arrak Rukkharat on 12/3/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ProgramsViewController.h"
#import "SessionsViewController.h"
#import "MBAPI.h"
@interface ProgramsViewController ()

@end

@implementation ProgramsViewController

- (id)initWithClientIDOrNil:(NSString*)clientIDForBooking
{
    if (self = [super init])
    {
        [self setTitle:@"Pick Service"];
        clientID = clientIDForBooking;
        sessions = [NSArray new];
        
        [SiteService GetServiceCategoriesTypeAppointmentWithBlock:^(ServiceCategoriesResult *result)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
                 if (result.ErrorCode == 200)
                 {
                     sessions = (NSArray*)result.Programs;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return sessions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    ServiceCategory *sess = [sessions objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", sess.Name];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Tab the class for booking
    if (clientID)
    {
        ServiceCategory *sc = [sessions objectAtIndex:indexPath.row];
        SessionsViewController *t = [[SessionsViewController alloc] initWithClientIDOrNil:clientID programID:sc.ID title:sc.Name];
        [self.navigationController pushViewController:t animated:YES];
    }
}

@end
