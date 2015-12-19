//
//  MainViewController.m
//  API DEMO
//
//  Created by Arrak Rukkharat on 11/17/15.
//  Copyright (c) 2015 Arrak Rukkharat. All rights reserved.
//

#import "ViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)init
{
    if (self = [super init])
    {
        [self setTitle:@"MINDBODY API Demos"];
        demos = [[NSArray alloc] initWithObjects:
                 @"New client",
                 @"Client login",
                 @"Staff login",
                 @"Client demos",
                 @"Staff demos",
                 @"Class schedules",
                 @"Class booking",
                 @"Appointment booking",
                 
                 nil];
        [self.tableView reloadData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return [demos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    // Configure the cell...
    cell.textLabel.text = [demos objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        NewClientViewController *vc = [[NewClientViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 1)
    {
        ClientLoginViewController *vc = [[ClientLoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 2)
    {
        StaffLoginViewController *vc = [[StaffLoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 3)
    {
        ClientSearchViewController *vc = [[ClientSearchViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 4)
    {
        StaffMembersViewController *vc = [[StaffMembersViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 5)
    {
        ClassViewController *vc = [[ClassViewController alloc] initWithClientIDOrNil:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 6)
    {
        ClassClientSearchViewController *vc = [[ClassClientSearchViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (indexPath.row == 7)
    {
        ApptClientSearchViewController *vc = [[ApptClientSearchViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
